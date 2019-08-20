extends Node2D

var selected = global.colors.purple;

func _ready():
	$SlotLeft.init();
	$SlotCenter.init();
	$SlotRight.init();
	$Grid.connect_node($SlotLeft);
	$Grid.connect_node($SlotCenter);
	$Grid.connect_node($SlotRight);
	pass