extends Area2D


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		for i in get_tree().get_nodes_in_group("player"):
			if i.name == "player_2":
				i.set_physics_process(true)


func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		for i in get_tree().get_nodes_in_group("player"):
			if i.name == "player_2":
				i.set_physics_process(false)
