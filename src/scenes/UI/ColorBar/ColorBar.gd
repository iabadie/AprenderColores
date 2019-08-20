extends Control

var Slot = load("res://src/scenes/UI/ColorBar/ColorSlot/ColorSlot.tscn");
var slots = [];

func _ready():
	var screenWidth = get_viewport().size.x;
	var columns = floor((screenWidth / 90) - 1);
	$GridContainer.columns = columns
	for n in range(columns):
		var slot = Slot.instance();
		slots.append(slot)
		$GridContainer.add_child(slot);
	change_color(0);
	pass

func change_color(newColor):
	var color = global.colorsResources[newColor];
	for slot in slots:
		slot.change_block_color(color);
	pass
