extends KinematicBody2D

#gets health bar
onready var health_bar = get_node("CanvasLayer/GUI/Heath Bar")

#SET HEALTH USING SET_HEALTH or self.health = (the number), as doing otherwise will not update health bar
var health : float setget set_health #int maybe? i did float so it can be divided by non integers, and the hp bar can just round
#the velocity
export var gravity : float
var velocity : Vector2
export var acceleration : float
export var deceleration : float
export var maxspeed : float
export var jump_height : float
const UP : Vector2 = Vector2(0, -1)

func _ready():
	#sets value to 100% on startup
	self.health = 100

func _process(_delta):
	pass
	
func _physics_process(delta):
	#handle the keyboard & convert to movement
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y -= jump_height
	if Input.is_action_pressed("ui_down"):
		pass
	if Input.is_action_pressed("ui_left"):
		velocity.x -= acceleration
	elif Input.is_action_pressed("ui_right"):
		velocity.x += acceleration
	else:
		velocity.x /= (deceleration/100 + 1)

	
	#sets x velocity to velocity but clamped at maxspeed
	velocity.x = clamp(velocity.x, -maxspeed, maxspeed)
	
	#adds the gravity to velocity to the y velocity
	velocity.y += gravity*delta
	velocity = move_and_slide(velocity, UP)
	pass
	
func set_health(value):
	health = value
	health_bar.value = value
	if health <= 0:
		die()
	
func die():
	#this happens when you die
	pass
