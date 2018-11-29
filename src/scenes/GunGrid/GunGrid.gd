extends Control

var GunSlot = load("res://src/scenes/GunGrid/Slot/GunSlot.tscn");
var gunSlots = [];
var gunPosition;
var pressed = false;
var screenWidth;
var halfScreenPixelsPosition;
var Gun = null;

func _ready():
	screenWidth = get_viewport().size.x;
	halfScreenPixelsPosition = screenWidth / 2;
	var columns = floor((screenWidth / 90) - 1);
	for n in range(columns):
		var gunslot = GunSlot.instance();
		gunSlots.append(gunslot)
		$GridContainer.add_child(gunslot);
	gunPosition = ceil(columns / 2)
	pass

func init(GunNode):
	Gun = GunNode;
	moveGunToNewPosition();
	pass

func setNewGunPosition(direction):
	if direction == 1:
		if gunSlots.size() == gunPosition + 1:
			return
		gunPosition += 1;
	else:
		if gunPosition == 0:
			return
		gunPosition -= 1;
	moveGunToNewPosition();
	pass

func moveGunToNewPosition():
	Gun.position = gunSlots[gunPosition].find_node("center").get_global_position();
	pass

func _on_TouchArea_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("touch") and not pressed:
		pressed = true
		var direction;
		if get_global_mouse_position().x > halfScreenPixelsPosition:
			direction = 1;
		else: direction = -1;
		setNewGunPosition(direction)
	elif Input.is_action_just_released("touch") and pressed:
		pressed = false
	pass
