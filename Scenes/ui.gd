extends CanvasLayer

class_name UI

@onready var Panda1_Points_Label = $"MarginContainer/Panda1 Point"
@onready var Panda2_Points_Label = $"MarginContainer/Panda2 Point"

func _ready():
	Panda1_Points_Label.text = "%d" % 0
	Panda2_Points_Label.text = "%d" % 0
	
func update_Panda1_Points(points: int):
	Panda1_Points_Label.text = "%d" % points
	
func update_Panda2_Points(points: int):
	Panda2_Points_Label.text = "%d" % points
	
	
	
