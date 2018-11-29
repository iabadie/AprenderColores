extends Button

export (String) var buttonText

func _ready():
	$Text.text = buttonText;
	pass
