extends Timer

@onready var big_demon_scene = preload("res://scenes/enemy.tscn")
@onready var imp_scene = preload("res://scenes/imp.tscn")
@onready var player = get_parent()





func _on_timeout(): 
	spawn_new_enemy()


func spawn_new_enemy():
	var minion_big = big_demon_scene.instantiate()
	var minion_small = imp_scene.instantiate()
	var x = randf_range(-175.0, 25.0)  # your random X offset
	var y = player.position.y + 180
	print("Position:")
	print(x)
	print(y)
	minion_big.global_position = Vector2(x, y)
	minion_small.global_position = Vector2(x, y)
	get_tree().current_scene.add_child.call_deferred(minion_big)
	get_tree().current_scene.add_child.call_deferred(minion_small)
# 0 -> -12
# 1 -> 1
# 13*x-12
