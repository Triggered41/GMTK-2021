extends Area2D

var speed = 20

func _physics_process(delta):
	position += speed * transform.x


func _on_Area2D_body_entered(body):
	queue_free()
	if body.is_in_group("player"):
		GLobalData.health -= 10
