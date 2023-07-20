extends Node

signal update_health
signal update_laser_amount
signal update_grenade_amount

var laser_amount: int = 10:
	set(value):
		laser_amount = value
		update_laser_amount.emit()
	get:
		return laser_amount

var grenade_amount: int = 3:
	set(value):
		grenade_amount = value
		update_grenade_amount.emit()
	get:
		return grenade_amount

var health: int = 50:
	set(value):
		health = value
		update_health.emit()
	get:
		return health
