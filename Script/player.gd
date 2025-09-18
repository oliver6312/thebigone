extends CharacterBody2D

@export var speed = 100
@export var friction = 0.1
@export var acceleration = 0.08
@onready var healthbar: ProgressBar = $healthbar

var current_dir = "none"

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if (Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") != Vector2.ZERO):
		velocity = velocity.lerp(input_direction * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)

	if Input.is_action_pressed('ui_right'):
		current_dir = "right"
	if Input.is_action_pressed('ui_left'):
		current_dir = "left"

	if (Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") != Vector2.ZERO):
		play_anim(1)
	else:
		play_anim(0)

func _physics_process(delta):
	enemy_attack()
	if health <= 0:
		player_alive = false
		#go back to menu
		health = 0
		print("Player has been killed")
		self.queue_free()
	
	get_input()
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
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true: 
		health = health - 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		healthbar.value = health
		print (health)

func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true

func _ready() -> void:
	healthbar.value = health
