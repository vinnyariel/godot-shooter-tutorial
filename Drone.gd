extends CharacterBody2D

const speed: float = 300

func _process(_delta):
	velocity.x = speed
	move_and_slide()

func hit():
	print("DAMAGE!")
