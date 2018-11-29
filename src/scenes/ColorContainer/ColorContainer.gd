extends Node2D

export (Color) var myColor = Color(1,1,1,1); 

var activated = false;
var isHolded = false;
var slotArea = null;
var currentPosition = null;
var startPosition = null;

signal droped_color;

func _ready():
	currentPosition = position;
	startPosition = position;
	pass

func _process(delta):
	if isHolded:
		position = get_global_mouse_position();
	pass

func activateColor(value):
	activated = value;
	$Particles.emitting = value;
	
func _on_Area_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("touch") and !isHolded:
		isHolded = true;
		activateColor(true);
	if Input.is_action_just_released("touch") and isHolded:
		isHolded = false;
		if slotArea:
			position = slotArea.global_position;
			currentPosition = slotArea.global_position;
			emit_signal("droped_color", myColor, slotArea.slot);
		else:
			position = currentPosition;
		activateColor(false);
	if Input.is_action_just_released("touch") and !slotArea:
		position = startPosition;
		currentPosition = startPosition;
	pass

func _on_Area_area_entered(area):
	slotArea = area;
	pass


func _on_Area_area_exited(area):
	if slotArea:
		slotArea = null;
	pass
