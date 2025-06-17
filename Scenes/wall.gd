extends Area2D

signal point_scored(Scoring_player: String)



func _on_body_entered(body: Node2D) -> void:
	if body is Panda1:
		point_scored.emit("Panda2")
	elif body is Panda2:
		point_scored.emit("Panda1")
		
		
