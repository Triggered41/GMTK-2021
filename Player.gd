extends KinematicBody2D

#gets health bar
onready var health_bar = get_node("GUI/Heath Bar")

#SET HEALTH USING SET_HEALTH or self.health = (the number), as doing otherwise will not update health bar
var health : float setget set_health #int maybe? i did float so it can be divided by non integers, and the hp bar can just round

func _ready():
	#sets value to 100% on startup
	health = 100

func _process(delta):
	self.health -= 0.01
	print(health)
	pass
	
func set_health(value):
	health = value
	health_bar.value = value
	if health <= 0:
		die()
	
func die():
	#this happens when you die
	pass
