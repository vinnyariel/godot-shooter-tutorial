extends Area2D

var rotation_speed: int = 3

var available_type = ["laser", "grenade", "health"]
var type = available_type[randi()%available_type.size()]

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color("57ffff")
	if type == "grenade":
		$Sprite2D.modulate = Color("ff4c00")
	if type == "health":
		$Sprite2D.modulate = Color("00ff00")
	print(type)

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(body):
	if "add_item" in body:
		body.add_item(type)
	queue_free()
