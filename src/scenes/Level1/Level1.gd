extends Node2D

const finish_dialog = preload("res://src/scenes/UI/FinishDialog/FinishDialog.tscn")

var points = 0;

func _ready():
	$Points.text = String(points);

func lose_level():
	var dialog = finish_dialog.instance()
	add_child(dialog)
	dialog.show_dialog(points)
	$GridGenerator.get_tree().paused = true

func add_points(newPoints = 10):
	points += newPoints;
	$Points.text = String(points);
	if points % 100 == 0:
		get_tree().call_group("generador", "up_speed")

func end_game():
	lose_level()
	pass