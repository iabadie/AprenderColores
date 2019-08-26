extends HBoxContainer

const container_node = "CenterContainer{str}/TextureRect/Color"

func _ready():
	pass # Replace with function body.

func set_colors_helper(colors):
	for i in range(1, colors.size() + 1):
		get_node(container_node.format({"str": i})).texture = colors[i - 1]
	
	
