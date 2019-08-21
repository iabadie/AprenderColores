extends Node2D

# This scene container the autogenerated line with blocks of colors

onready var ColorBall = preload("res://src/scenes/ColorBall/ColorBall.tscn")

var noDetected = true;
var screenWidth;
var columns;
var colors = global.primaryColors;
var expectedColor;
const xoffset = 90;

var gridValues = null;

func _ready(tweenTime = 2.0):
	screenWidth = get_viewport().size.x - xoffset;
	columns = int(screenWidth / xoffset);
	generate_colors();
	$Tween.interpolate_property(self, "position", position, Vector2(position.x, 900), tweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN);
	$Tween.start();
	pass

# Si el area del los colores choca contra el grid de color selecionado por primera vez
# se enviará una señal de grupo al grid de color seleccionado indicando el color correspondiente
# y comenzará la modulación para desaparecer el nodo
func _on_Area2D_area_entered(area):
	if noDetected:
		noDetected = false;
		get_tree().call_group("colors_collision", "check_color", gridValues);
		$Tween.interpolate_property(self, "modulate", modulate, Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN);
		$Tween.start();
	pass

func generate_colors():
	# instancia 2 nuevos colores en la grilla
	var color_one = ColorBall.instance();
	var color_two = ColorBall.instance();
	randomize();
	# Decide si debe generar bloques corazon o no, con una probabilidad de X
	var get_heart = rand_range(0, 1) > 0.1
	if get_heart:
		color_one.set_heart()
		color_two.set_heart()
	# setea la posición de los 2 colores instanciados evitando repetición
	var first_position = int(rand_range(0, columns));
	color_one.position = Vector2(first_position * xoffset + 45, 0);
	var second_position = int(rand_range(0, columns));
	while second_position == first_position:
		second_position = int(rand_range(0, columns));
	color_two.position = Vector2(second_position * xoffset + 45, 0);
	# setea los colores primarios correspondientes evitando repetición
	var first_color = int(rand_range(0, 3));
	color_one.set_texture(colors[first_color]);
	var second_color = int(rand_range(0, 3));
	while second_color == first_color:
		second_color = int(rand_range(0, 3));

	color_two.set_texture(colors[second_color]);
	# agrega los nodos al arbol
	add_child(color_one);
	add_child(color_two);
	expectedColor = first_color + second_color;
	match  expectedColor:
		1:
			expectedColor = global.colors.purple
		2:
			expectedColor = global.colors.orange
		3:
			expectedColor = global.colors.green
	gridValues = { "expectedColor": expectedColor, "first_position": first_position, "second_position": second_position, "is_heart": get_heart }
	pass

# Elimina el ColorGrid de memoria al finalizar la modulación a transparente
func _on_Tween_tween_completed(object, key):
	if key == ":modulate":
		queue_free();
	pass 