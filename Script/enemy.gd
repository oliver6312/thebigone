extends CharacterBody2D

var speed = 30
var player_chase = true
@onready var player = get_parent().get_node("Player")

var fireball_inattack_range = false
var fireball_attack_cooldown = true
var enemy_health = 100
var enemy_alive = true
@onready var healthbar: ProgressBar = $healthbar

func big_enemy():
	pass

func _physics_process(delta: float) -> void:
	fireball_attack()

	if player_chase:
		var direction = (player.position - position).normalized()
		velocity = (direction*speed)
		
		
		$AnimatedSprite2D.play("Run")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	move_and_slide()




func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		fireball_inattack_range = true


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("fireball"):
		fireball_inattack_range = false

func fireball_attack():
	if fireball_inattack_range: 
		enemy_health = enemy_health - 2
		fireball_attack_cooldown = false
		$attack_cooldown.start()
		healthbar.value = enemy_health
		print (enemy_health)
		if enemy_health <= 0:
			self.queue_free()
		


func _on_attack_cooldown_timeout() -> void:
	fireball_attack_cooldown = true

func _ready() -> void:
	healthbar.value = enemy_health
