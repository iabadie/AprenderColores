extends Node2D

onready var containerNode = get_node("Control/CenterContainer/VBoxContainer/")

func set_colors_helper(color_elements):
	for i in range(0, color_elements.size()):
		containerNode.get_child(i).set_colors_helper(color_elements[i])