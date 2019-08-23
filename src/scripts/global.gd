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

var navigationStack = [menuScene]

var global_score = 0

func _ready():
	get_tree().set_auto_accept_quit(false);
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST or what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		if global.navigationStack.size() > 1:
			# Go back to last view
			navigationStack.pop_back()
			get_tree().change_scene(navigationStack.back());
		else:
			get_tree().quit();
			# quitting app or back-button on Android
	pass