extends CharacterBody2D

#@export var target_position: Vector2
@onready var flame_1: Sprite2D = $flame_1
@onready var flame_2: Sprite2D = $flame_2
@onready var flame_3: Sprite2D = $flame_3
@onready var flame_4: Sprite2D = $flame_4
@onready var flame_5: Sprite2D = $flame_5
@onready var teleport: CharacterBody2D = $teleport
@onready var circle: CollisionShape2D = $teleport/Circle
@onready var timer: Timer = $Timer
@onready var symbols: Sprite2D = $Symbols


var candle_1_lit = false
var candle_2_lit = false
var candle_3_lit = false
var candle_4_lit = false
var candle_5_lit = false


func _ready() -> void:
	flame_1.visible = false
	flame_2.visible = false
	flame_3.visible = false
	flame_4.visible = false
	flame_5.visible = false
	symbols.visible = false
	circle.disabled = true

func _physics_process(delta):
	if candle_1_lit == true and candle_2_lit == true and candle_3_lit == true and candle_4_lit == true and candle_5_lit == true:
		circle.disabled = false
		symbols.visible = true
	if candle_1_lit == false and candle_2_lit == false and candle_3_lit == false and candle_4_lit == false and candle_5_lit == false:
		circle.disabled = true
		symbols.visible = false

func shutdown():
	flame_1.visible = false
	candle_1_lit = false
	flame_2.visible = false
	candle_2_lit = false
	flame_3.visible = false
	candle_3_lit = false
	flame_4.visible = false
	candle_4_lit = false
	flame_5.visible = false
	candle_5_lit = false

func _on_firezone_1_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_1.visible = true
		candle_1_lit = true
func _on_firezone_2_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_2.visible = true
		candle_2_lit = true
func _on_firezone_3_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_3.visible = true
		candle_3_lit = true
func _on_firezone_4_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_4.visible = true
		candle_4_lit = true
func _on_firezone_5_body_entered(body: Node2D) -> void:
	if body.has_method("fireball"):
		print("The fire is lit")
		flame_5.visible = true
		candle_5_lit = true
