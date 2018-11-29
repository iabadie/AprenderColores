extends Node

# Scenes
var menuScene = "res://src/scenes/Menu/Menu.tscn";
var LevelOneScene = "res://src/scenes/Level1/Level1.tscn";

# Define primary and secondary colors enum
enum SECONDARY{ purple, green, orange };
enum PRIMARY{ red, blue, yellow };
enum colors{ red, blue, yellow, purple, green, orange };

# Define texture imports for secondary
var purple = preload("res://src/resources/blocks/purple.png");
var green = preload("res://src/resources/blocks/green.png");
var orange = preload("res://src/resources/blocks/orange.png");
# Define texture imports for primary
var red = preload("res://src/resources/selectors/sel_red.png");
var blue = preload("res://src/resources/selectors/sel_blue.png");
var yellow = preload("res://src/resources/selectors/sel_yellow.png");

var colorsResources = [red, blue, yellow, purple, green, orange];

var secondaryColors = [purple, green, orange];
var primaryColors = [red, blue, yellow];
