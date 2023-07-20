extends CharacterBody2D

@export var walk_speed: int = 300
@export var run_speed: int = 500
var speed: int = walk_speed

var shoot_ready: bool = true
var grenade_ready: bool = true
signal laser_shoot(pos, direction)
signal grenade_shoot(pos, direction)
signal ui_update

func _process(_delta):
	# Check inputs (AWSD or Left, Right, Up, Down arrows)
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# Move the player with delta fix and collision
	velocity = direction * speed
	move_and_slide()
	
	# Player angle follow the mouse position
	look_at(get_global_mouse_position())
	
	# Get the normalized Vector2 of the mouse_position (???)
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# Laser input
	if Input.is_action_just_pressed("primary action") and shoot_ready and Globals.laser_amount > 0:
		# Laser amount -= 1
		Globals.laser_amount -= 1
		# Start the particle
		$GunParticle.emitting = true
		# Get all of the marks
		var laser_markers = $LaserStartPosition.get_children()
		# Select a random mark
		var laser_position = laser_markers[randi() % laser_markers.size()]
		# Start the cooldown timer
		$Timers/ShootTimer.start()
		# Emit the custom signal and deliver the position of mark
		laser_shoot.emit(laser_position.global_position, player_direction)
		# Lock the laser condition
		shoot_ready = false
	
	# Grenade input
	if Input.is_action_just_pressed("secondary action") and grenade_ready and Globals.grenade_amount > 0:
		# Grenade amount -= 1
		Globals.grenade_amount -= 1
		# Get all of the marks and randomize it, get the global_position of the selected mark
		var grenade_pos = $LaserStartPosition.get_children()[randi() % 3].global_position
		# Start the cooldown timer
		$Timers/GrenadeTimer.start()
		# Emit the custom signal and deliver the position of mark
		grenade_shoot.emit(grenade_pos, player_direction)
		# Lock the laser condition
		grenade_ready = false
	
func _on_shoot_timer_timeout():
	shoot_ready = true

func _on_grenade_timer_timeout():
	grenade_ready = true

func add_item(type):
	if type == "laser":
		Globals.laser_amount += 10
	if type == "grenade":
		Globals.grenade_amount += 3
	ui_update.emit()
