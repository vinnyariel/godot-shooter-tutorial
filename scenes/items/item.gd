extends Area2D

var rotation_speed: int = 3

var available_type = ["laser", "grenade", "health"]
#var type = available_type[randi()%available_type.size()]
var type = "grenade"

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color("57ffff")
	if type == "grenade":
		$Sprite2D.modulate = Color("ff4c00")
	if type == "health":
		$Sprite2D.modulate = Color("00ff00")

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	if type == "health":
		Globals.health += 10
	if type == "laser":
		Globals.laser_amount += 10
	if type == "grenade":
		Globals.grenade_amount += 3
	queue_free()
