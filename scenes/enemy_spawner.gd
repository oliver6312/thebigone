extends Timer

@onready var enemy_scene = preload("res://scenes/enemy.tscn")

func _ready() -> void:
	spawn_new_enemy()

func _on_timeout(): 
	spawn_new_enemy()


func spawn_new_enemy():
	var minion = enemy_scene.instantiate()
	# Optionally set a random position
	minion.position = Vector2(13*randf()-12, 20)
	get_tree().current_scene.add_child.call_deferred(minion)
# 0 -> -12
# 1 -> 1
# 13*x-12
