extends Node2D

const finish_dialog = preload("res://src/scenes/UI/FinishDialog/FinishDialog.tscn")

const helper = preload("res://src/scenes/ColorsHelper/ColorsHelper.tscn")

var points = 0;

func _ready():
	$Points.text = String(points);
	var helper_scene = helper.instance()
	add_child(helper_scene)
	helper_scene.set_colors_helper(
		[
			[global.blue, global.yellow, global.green],
			[global.yellow, global.red, global.orange],
			[global.red, global.blue, global.purple]
		]
	)

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