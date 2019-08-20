extends Node2D

export (String, "purple", "green", "orange") var slotColor = "purple";
var selection
var pressed = false;
signal change_color;

func init():
	selection = global.colors[slotColor];
	$Color.set_texture(global.colorsResources[global.colors[slotColor]]);

func set_color():
	emit_signal("change_color", selection)


func _on_SlotArea_input_event(viewport, event, shape_idx):
	if (event is InputEventScreenTouch and event.is_pressed()) or Input.is_action_just_pressed("touch") and not pressed:
		set_color();
	elif Input.is_action_just_released("touch") and pressed:
		pressed = false
	pass

