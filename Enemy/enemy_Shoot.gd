extends Node2D


var can_shoot = true
export var projectile: PackedScene

func shoot():
	if can_shoot:
		var proj = projectile.instance() as Area2D
		get_tree().root.add_child(proj)
		proj.modulate = Color.red
		proj.global_position = $fire_point.global_position
		proj.global_rotation = $fire_point.global_rotation
		$fire_rate.start()
		can_shoot = false

func _on_fire_rate_timeout():
	can_shoot = true
