extends Node2D

onready var ColorBall = preload("res://src/scenes/ColorBall/ColorBall.tscn")

var noDetected = true;
var screenWidth;
var columns;
var colors = global.colorsResources;
var colorsSize = 3;

signal move_down;

func _ready():
	var colorWidth = 90;
	screenWidth = get_viewport().size.x - 90;
	columns = floor(screenWidth / colorWidth);
	var i = 0;
	var xoffset = 45;
	var yoffset = 45;
	var rows = 4;
	while(i < columns):
		var j = 0;
		while(j<rows):
			var color = ColorBall.instance();
			color.position = Vector2(xoffset, yoffset);
			var ownColor = (randi() % colorsSize) + 3;
			color.set_texture(colors[ownColor]);
			color.ownColor = ownColor;
			color.listenSignals(self);
			add_child(color)
			yoffset += colorWidth;
			j += 1;
		yoffset = 45;
		xoffset += colorWidth;
		i += 1;
	pass

func _on_Timer_timeout():
	emit_signal("move_down");
	pass

func _on_Area2D_area_entered(area):
	if area.name == "ColorArea" && noDetected:
		noDetected = false;
		$Timer.stop();
		get_tree().call_group("level", "lose_level")
		print("Perdiste");
	pass
