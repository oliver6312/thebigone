extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null

func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)*speed
		#turotiral said to divide by speed but I think multply makes more sense
		
		$AnimatedSprite2D.play("Run")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSpride2D.flip_h = true
		else:
			$AnimatedSpride2D.flip_h = false
		
	else:
		$AnimatedSprite2D.play("Idle")


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
