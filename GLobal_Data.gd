extends Node


var player1 = true


func _physics_process(delta):
	
	if Input.is_action_just_released("ui_cancel"):
		player1 = !player1
	
	
	
	
