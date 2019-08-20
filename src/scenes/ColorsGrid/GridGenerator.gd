extends Node2D
onready var colorsGrid = preload("res://src/scenes/ColorsGrid/ColorsGrid.tscn");

export (int) var generateTime = 3;

func _ready():
	$Timer.wait_time = generateTime;
	pass

func _on_Timer_timeout():
	$Timer.start();
	add_child(colorsGrid.instance());
	pass # Replace with function body.
