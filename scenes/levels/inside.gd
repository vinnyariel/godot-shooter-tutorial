extends LevelParent

@export var outside_level_scene: PackedScene

func _on_exit_gate_body_entered(_body):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 1).set_trans(Tween.TRANS_QUAD)
	get_tree().change_scene_to_packed(outside_level_scene)
