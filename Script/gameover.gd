class_name GameOver extends CanvasLayer

@onready var currentscore: Label = %currentscore_label
@onready var high_score: Label = %highscore_label
@onready var restart: Button = %restart_button
@onready var quit: Button = %quit_button

func set_score(n:int):
	currentscore.text = "Final Score: " + str(n)
	if n > Global.save_data.high_score:
		high_score.visible = true
		Global.save_data.high_score = n
		Global.save_data.save()
	else:
		high_score.visible = false

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit() 
