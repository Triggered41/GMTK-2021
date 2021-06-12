extends Navigation2D


onready var line = $Line2D


func _physics_process(delta):
	
	if !GLobalData.player1:
		var player = get_node("player-1")
		var path = get_simple_path(player.global_position, Vector2(410, 230))
		line.points = path
		
		var direction = (path[1] - player.global_position).normalized()
		player.velocity.x = lerp(player.velocity.x, direction.x * player.speed, 0.5)
		if path[1].y < player.global_position.y and player.global_position.distance_to(path[1]) <= 200.0:
			player.jump()
