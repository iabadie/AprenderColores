extends Node2D

const points_message = "Puntaje "

func show_dialog(points):
	$Control/CenterContainer/VBoxContainer/Points.text = points_message + String(points)
	$Tween.interpolate_property(self, "rotation_degrees", 0, 360, 0.7,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.interpolate_property(self, "position", position, Vector2(0, 500), 0.7,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
	pass


func _on_Back_pressed():
	global._notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
	queue_free()
	get_tree().paused = false
	pass # Replace with function body.


func _on_Retry_pressed():
	queue_free()
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.
