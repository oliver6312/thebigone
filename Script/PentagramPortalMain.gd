extends CharacterBody2D

#@export var target_position: Vector2
@onready var circle: CollisionShape2D = $Circle

func portal():
	pass



#func _on_portal_body_entered(body: Node2D) -> void:
#	print ("Player in portal")
#	if body.has_method("player"):
#		body.global_position = Vector2(-10, 10)
