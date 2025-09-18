extends Timer

@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var player = get_parent()

func _ready() -> void:
	spawn_new_enemy()

func _on_timeout(): 
	spawn_new_enemy()


func spawn_new_enemy():
	var minion = enemy_scene.instantiate()
	var x = randf_range(-175.0, 25.0)  # your random X offset
	var y = player.position.y + 180
	print("Position:")
	print(x)
	print(y)
	minion.global_position = Vector2(x, y)
	get_tree().current_scene.add_child.call_deferred(minion)
# 0 -> -12
# 1 -> 1
# 13*x-12
