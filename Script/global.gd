extends Node

var fireball_current_attack = false

var save_data:SaveData

func _ready():
	save_data = SaveData.load_or_create()
