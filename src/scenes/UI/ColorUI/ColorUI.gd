extends Node2D

var disabled = true;
var selectedColor; # Representa el número del color almaenado en global

signal on_select_color;

func init(colorEnum, colDisabled = false):
	disabled = colDisabled;
	selectedColor = colorEnum;
	$Color.set_texture(global.colorsResources[colorEnum]);

func _on_SlotArea_input_event(viewport, event, shape_idx):
	if !disabled && Input.is_action_just_pressed("touch"):
		disabled = true;
		emit_signal("on_select_color", self);
	pass
