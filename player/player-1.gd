extends KinematicBody2D

var speed = 500
var GRAVITY = 50
var JUMP_FORCE = 1300
var velocity = Vector2.ZERO
var accel = 0.5

func _physics_process(delta):
	if GLobalData.player1:
		movement()
		modulate = Color.red
	if !is_on_floor():
		velocity.y += GRAVITY
	else:
		velocity.y = 0
		if Input.is_action_pressed("ui_select"):
			jump()
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
func movement():
	
	var movex = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity.x = lerp(velocity.x, movex * speed, accel)
func jump():
	velocity.y = -JUMP_FORCE
