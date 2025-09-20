extends CharacterBody2D

#@export var target_position: Vector2
@onready var flame_1: Sprite2D = $flame_1
@onready var flame_2: Sprite2D = $flame_2
@onready var flame_3: Sprite2D = $flame_3
@onready var flame_4: Sprite2D = $flame_4
@onready var flame_5: Sprite2D = $flame_5
@onready var teleport: CharacterBody2D = $teleport
@onready var circle: CollisionShape2D = $teleport/Circle


func _ready() -> void:
	flame_1.visible = false
	flame_2.visible = false
	flame_3.visible = false
	flame_4.visible = false
	flame_5.visible = false
	circle.disabled = true


func _on_firezone_1_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_1.visible = true

func _on_firezone_2_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_2.visible = true

func _on_firezone_3_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_3.visible = true

func _on_firezone_4_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_4.visible = true

func _on_firezone_5_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_5.visible = true
