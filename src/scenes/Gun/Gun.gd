extends Node2D

var Bullet = preload("res://src/scenes/Bullet/Bullet.tscn");

var source_left = global.colors.red;
var source_right = global.colors.blue;
var mixed_color = null;
var mixed_color_value = null;

func GunConnect(source_one, source_two, signal_name):
	source_one.connect(signal_name, self, "get_left_source");
	source_two.connect(signal_name, self, "get_right_source");

func get_left_source(index):
	source_left = index;
	mix_colors()

func get_right_source(index):
	source_right = index;
	mix_colors()

func mix_colors():
	if source_left == source_right:
		if source_left == global.colors.red:
			mixed_color = global.colorsResources[global.colors.red];
			mixed_color_value = global.colors.red;
		if source_left == global.colors.blue:
			mixed_color = global.colorsResources[global.colors.blue];
			mixed_color_value = global.colors.blue;
		if source_left == global.colors.yellow:
			mixed_color = global.colorsResources[global.colors.yellow];
			mixed_color_value = global.colors.yellow;
	elif source_left * source_right == global.colors.red and (source_left == global.colors.yellow or source_right == global.colors.yellow):
		mixed_color = global.colorsResources[global.colors.orange];
		mixed_color_value = global.colors.orange;
	elif (source_left * source_right == global.colors.red):
		mixed_color = global.colorsResources[global.colors.purple];
		mixed_color_value = global.colors.purple;
	else:
		mixed_color = global.colorsResources[global.colors.green];
		mixed_color_value = global.colors.green;
	$ColorGun.set_texture(mixed_color);
	
	
func get_mixed_color():
	return mixed_color_value;


func _on_Timer_timeout():
	var bullet = Bullet.instance();
	bullet.position = $spawn.get_global_position();
	get_node("/root").add_child(bullet);
	bullet.init(mixed_color_value);
	pass

func lose_level():
	$Timer.stop();