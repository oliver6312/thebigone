class_name HUD extends CanvasLayer

@onready var current_score: Label = %Score
@onready var high_score: Label = %Highscore

func _ready() -> void:
	high_score.text = "High Score: " + str(Global.save_data.high_score)
	
func update_score(n:int):
	current_score.text = "Score:" + str(n)
