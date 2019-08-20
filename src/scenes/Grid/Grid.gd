extends Control

var SlotGrid = load("res://src/scenes/Grid/SlotGrid/SlotGrid.tscn");
var slots;
var screenWidth;
var halfScreenPixelsPosition;
var colorSelected;

func _ready():
	slots = $GridContainer.get_children();
	change_color(global.colors.purple);
	pass

func connect_node(sender):
	sender.connect("change_color", self, "change_color");
	pass

func change_color(color):
	colorSelected = color;
	for slot in slots:
		slot.find_node("Color").set_texture(global.colorsResources[color]);
	pass
	
func check_color(arrivedValues):
	if arrivedValues.expectedColor == colorSelected:
		get_tree().call_group("level", "add_points");
	else:
		$GridContainer.get_child(arrivedValues.first_position).decrease_life()
		$GridContainer.get_child(arrivedValues.second_position).decrease_life()
	pass
