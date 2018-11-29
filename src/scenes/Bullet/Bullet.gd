extends KinematicBody2D

export (int) var speed = 20;

var velocity = Vector2(0, -speed);
var ownColor = null;

func init(newColor):
	$ColorBullet.set_texture(global.colorsResources[newColor]);
	ownColor = newColor;
	pass

func _physics_process(delta):
	var collision = move_and_collide(velocity);
	if collision != null:
		print(collision);
	pass

func getColor():
	return ownColor;