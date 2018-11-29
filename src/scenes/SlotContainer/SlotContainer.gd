extends Node2D

var colors = global.primaryColors;
var colorsSize = colors.size();
# selection var to index the colors var
var selection = global.PRIMARY.red;
var pressed = false;
signal set_color;

func init():
	set_color();

func set_color():
	$Color.set_texture(colors[selection])
	emit_signal("set_color", selection)


func _on_SlotArea_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("touch") and not pressed:
		pressed = true
		selection += 1;
		if selection == colorsSize:
			selection = 0;
		set_color();
	elif Input.is_action_just_released("touch") and pressed:
		pressed = false
	pass
