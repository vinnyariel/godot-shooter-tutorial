extends LevelParent

func _on_gate_player_entered_gate():
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed", 0, 1).set_trans(Tween.TRANS_QUAD)
	FadeScreen.change_scene("res://scenes/levels/inside.tscn")
