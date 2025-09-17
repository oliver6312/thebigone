extends CharacterBody2D

@export var speed = 100
@export var friction = 0.2
@export var acceleration = 0.08

var current_dir = "none"

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('ui_right'):
		current_dir = "right"
		play_anim(1)
		input.x += 1
	elif Input.is_action_pressed('ui_left'):
		current_dir = "left"
		play_anim(1)
		input.x -= 1
	elif Input.is_action_pressed('ui_down'):
		play_anim(1)
		input.y += 1
	elif Input.is_action_pressed('ui_up'):
		play_anim(1)
		input.y -= 1
	else:
		play_anim(0)
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	
	set_up_direction(Vector2.UP)
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
	if dir == "left":
		anim.flip_h = true
	if movement == 1: 
		anim.play("Run")
	if movement == 0:
		anim.play("Idle")

func player():
	pass

func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method(enemy):
		
	



func _on_player_hitbox_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
