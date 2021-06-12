extends KinematicBody2D


var speed = 250
var GRAVITY = 50
var JUMP_FORCE = 1300

var velocity = Vector2.ZERO

onready var line = get_parent().get_node("Line2D") 
onready var shooter = $Shoot

var shooting = false

var player: KinematicBody2D

func _ready():
	player = get_parent().get_node("player-1")

func _physics_process(delta):
	face_player()
	is_visible()
	if !is_on_floor():
		velocity.y += GRAVITY
	else:
		velocity.y = 0
	if !shooting:
		movement()
	path()
	velocity = move_and_slide(velocity, Vector2.UP)

func face_player():
	if player.global_position.x < global_position.x:
		$enemy.scale.x = -1.623
		attack("left_attack")
	elif player.global_position.x > global_position.x:
		$enemy.scale.x = 1.623
		attack("attack_anim")


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

func attack(anim):
	if global_position.distance_to(player.global_position) < 200:
		$AnimationPlayer.play(anim)
	else:
		$AnimationPlayer.stop()


func _on_Sword_body_entered(body):
	if body.is_in_group("player"):
		GLobalData.health -= 10
