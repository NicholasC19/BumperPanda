extends Node2D

var Panda1_Score = 0
var Panda2_Score = 0

@onready var panda_1: Panda1 = $Panda1
@onready var panda_2: Panda2 = $Panda2
@onready var ui: UI = $UI


var panda_1_start_position := Vector2(-236, -281)
var panda_2_start_position := Vector2(284, -285)


func _ready():
	print("hello world")
	
func _on_wall_point_scored(Scoring_player: String) -> void:
	if Scoring_player == "Panda1":
		Panda1_Score += 1
		print("P1Scored")
		ui.update_Panda1_Points(Panda1_Score)
		
		
	if Scoring_player == "Panda2":
		Panda2_Score += 1
		print("P2Scored")
		ui.update_Panda2_Points(Panda2_Score)
		
	reset_game_state()


func _on_wall_2_point_scored(Scoring_player: String) -> void:
	if Scoring_player == "Panda1":
		Panda1_Score += 1
		print("P1Scored")
		ui.update_Panda1_Points(Panda1_Score)
		
		
	if Scoring_player == "Panda2":
		Panda2_Score += 1
		print("P2Scored")
		ui.update_Panda2_Points(Panda2_Score)
		
	reset_game_state()
		

func reset_game_state():
	await get_tree().create_timer(1.3).timeout
	
	panda_1.pending_reset_position = panda_1_start_position
	panda_1.is_resetting = true
	
	panda_2.pending_reset_position = panda_2_start_position
	panda_2.is_resetting = true
	
	
	
