extends Container

export (StreamTexture) var image = null;

const firstHit = Color(1,1,1, 0.6)

const secondHit = Color(1,1,1, 0.3)

const lastHit = Color(1,1,1, 0.0)

var squareLife = 1

func _ready():
	$Center/Color.set_texture(image);
	pass

func decrease_life():
	squareLife -= 1
	change_block_state()
	if squareLife == -1:
		get_tree().call_group("end_game", "end_game")
	pass
	
func change_block_state():
	match squareLife:
		3:
			print("curar")
		2:
			print("primer golpe")
			$Center/Color.modulate = firstHit
			#$box.modulate = firstHit
		1:
			print("segundo golpe")
			$Center/Color.modulate = secondHit
			#$box.modulate = secondHit
		0:
			print("tercer golpe")
			$Center/Color.modulate = lastHit
			$box.modulate = lastHit
		-1:
			print("Destruir")