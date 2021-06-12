extends KinematicBody2D

onready var nav:Navigation2D = get_parent()
onready var shooter = $Shoot

var player 
var velocity = Vector2.ZERO
func _ready():
	player = nav.get_node("player-1")
	
func _physics_process(delta):
	shooter.look_at(player.global_position)
	shooter.shoot()
	var path = nav.get_simple_path(global_position, player.global_position, true)
	velocity = (path[1] - global_position).normalized()
	velocity = move_and_slide(velocity* 250)
