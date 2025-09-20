extends CharacterBody2D

var fireball_inattack_range = false
var fireball_attack_cooldown = true
@onready var flame: Sprite2D = $Flame

func _ready() -> void:
	flame.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		fireball_inattack_range = true
		print("The fire is lit")
		flame.visible = true
