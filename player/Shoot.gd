extends Node2D


export var projectile: PackedScene 
var can_shoot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	
	if Input.is_key_pressed(KEY_F) and can_shoot:
		shoot()
		$fire_rate.start()

func _on_fire_rate_timeout():
	can_shoot = true

func shoot():
	can_shoot = false
	var proj = projectile.instance() as Area2D
	get_tree().root.add_child(proj)
	proj.global_position = $fire_point.global_position
	proj.global_rotation = $fire_point.global_rotation

	
	
