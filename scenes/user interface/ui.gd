extends CanvasLayer

@onready var laser_label: Label = $Laser/Vbox/Label
@onready var laser_icon: TextureRect = $Laser/Vbox/TextureRect
@onready var grenade_label: Label = $Grenade/Vbox/Label
@onready var grenade_icon: TextureRect = $Grenade/Vbox/TextureRect
@onready var health_bar: TextureProgressBar = $HealthBar/MarginContainer/TextureProgressBar

var green: Color = Color("07b55b")
var red: Color = Color("ff1e2c")

func _ready():
	Globals.connect("update_health", update_health_text)
	Globals.connect("update_laser_amount", update_laser_text)
	Globals.connect("update_grenade_amount", update_grenade_text)
	update_grenade_text()
	update_laser_text()
	update_health_text()

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)

func update_health_text():
	health_bar.value = Globals.health

func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
