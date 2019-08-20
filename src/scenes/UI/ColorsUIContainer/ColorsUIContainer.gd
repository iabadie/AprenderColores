extends Node2D

onready var colorOnCenter = $Yellow;
var ableToChange = true;

func _ready():
	$Yellow.position = $SelectionPosition.position;
	$Yellow.init(global.colors.yellow, true);
	$Blue.init(global.colors.blue);
	$Red.init(global.colors.red);
	$Yellow.connect("on_select_color", self, "on_select_color");
	$Blue.connect("on_select_color", self, "on_select_color");
	$Red.connect("on_select_color", self, "on_select_color");	
	pass

func on_select_color(object):
	ableToChange = false;
	$CenterTween.interpolate_property(colorOnCenter, "position", colorOnCenter.position, object.position, 0.1, 0, 0, 0);
	$SelectedTween.interpolate_property(object, "position", object.position, colorOnCenter.position, 0.1, 0, 0, 0);
	$CenterTween.start();
	$SelectedTween.start();
	colorOnCenter = object;
	$ColorBar.change_color(object.selectedColor);


func _on_SelectedTween_tween_completed(object, key):
	ableToChange = true;
	pass # replace with function body


func _on_CenterTween_tween_completed(object, key):
	object.disabled = false;
