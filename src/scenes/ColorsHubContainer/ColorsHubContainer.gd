extends Node2D

func _ready():
	$Gun.GunConnect($SlotLeft, $SlotRight, "set_color")
	$SlotLeft.init();
	$SlotRight.init();
	$GunGrid.init($Gun);
	pass