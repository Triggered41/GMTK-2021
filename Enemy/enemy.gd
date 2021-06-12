extends KinematicBody2D


var speed = 500
var GRAVITY = 50
var JUMP_FORCE = 1300

var velocity = Vector2.ZERO

onready var line = get_parent().get_node("Line2D") 
onready var ray = $RayCast2D
onready var shooter = $Shoot

var player: KinematicBody2D

func _ready():
	player = get_parent().get_node("player-1")


func _physics_process(delta):
	
	shooter.look_at(player.global_position)
	is_visible()
	if !is_on_floor():
		velocity.y += GRAVITY
	else:
		velocity.y = 0
	movement()
	path()
	
	velocity = move_and_slide(velocity, Vector2.UP)
func is_visible():
	var dir = player.global_position - ray.global_position
	ray.cast_to = dir
	var col = ray.get_collider()
	if col and col.is_in_group("player"):
		shooter.shoot()

func path():
	var nav = get_parent() as Navigation2D
	var path = nav.get_simple_path(global_position, player.global_position)
#	line.points = path
	return path

func movement():
	var move_dir = (path()[1] - position).normalized()
	velocity.x = lerp(velocity.x, move_dir.x * speed, 0.8)
	if path()[1].y < position.y and is_on_floor():
		jump()

func jump():
	velocity.y = -JUMP_FORCE
	
	
