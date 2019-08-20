extends Node2D

const points_message = "Puntaje "

func show_dialog(points):
	$Control/CenterContainer/VBoxContainer/Points.text = points_message + String(points)
	$Tween.interpolate_property(self, "rotation_degrees", 0, 360, 0.7,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.interpolate_property(self, "position", position, Vector2(0, 500), 0.7,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()
	pass


func _on_Back_pressed():
	queue_free()
	# TODO sacar la pausa
	pass # Replace with function body.
