extends Sprite

var ownColor = null;

func listenSignals(father):
	father.connect("move_down", self, "move_down");
	pass;

func move_down():
	$Tween.interpolate_property(self, "position",
                position, Vector2(position.x, position.y + 90), 1,
                Tween.TRANS_LINEAR, Tween.EASE_IN_OUT);
	$Tween.start();

func start_remove_animation():
	$ColorAnimation.play("delete_color");
	pass

func _on_ColorAnimation_animation_finished(anim_name):
	if anim_name == "delete_color":
		queue_free();

func _on_ColorArea_area_entered(area):
	var bullet = area.get_parent();
	if bullet.name == "Bullet":
		if ownColor == bullet.getColor():
			start_remove_animation();
		bullet.queue_free();
	pass 
