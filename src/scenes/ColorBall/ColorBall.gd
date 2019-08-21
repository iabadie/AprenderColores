extends Sprite

const heart_image = preload("res://src/resources/blocks/heart.png")

func set_heart():
	$Heart.visible = true
	$Heart.texture = heart_image
	
