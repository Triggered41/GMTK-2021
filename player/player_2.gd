extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 5


func _ready():
	set_physics_process(false)
	

func _physics_process(delta):
	if !GLobalData.player1:
		movement()
		modulate = Color.red
	else:
		modulate = Color.white
	velocity = move_and_slide(velocity)
	
func movement():
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	else:
		velocity.y = 0
		
		
		
