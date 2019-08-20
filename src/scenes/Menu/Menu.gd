extends Control

func _on_Start_pressed():
	get_tree().change_scene(global.LevelOneScene);
	global.navigationStack.push_back(global.LevelOneScene);
	pass


func _on_Exit_pressed():
	get_tree().quit();
	pass