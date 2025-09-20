extends Timer

@onready var big_demon_scene = preload("res://scenes/enemy.tscn")
@onready var imp_scene = preload("res://scenes/imp.tscn")
@onready var bull_scene = preload("res://scenes/bull2.tscn")
@onready var player = get_parent()


func _on_timeout(): 
	spawn_new_enemy()

func spawn_new_enemy():
	var minion_big = big_demon_scene.instantiate()
	var minion_small = imp_scene.instantiate()
	var minion_bull = bull_scene.instantiate()
	var x = randf_range(-175.0, 25.0)  # your random X offset
	var y = player.position.y + 280
	print("Position:")
	print(x)
	print(y)
	minion_big.global_position = Vector2(x, y)
	minion_small.global_position = Vector2(x, y)
	minion_bull.global_position = Vector2(x, y)
	get_tree().current_scene.add_child.call_deferred(minion_big)
	get_tree().current_scene.add_child.call_deferred(minion_small)
	get_tree().current_scene.add_child.call_deferred(minion_bull)
# 0 -> -12
# 1 -> 1
# 13*x-12
