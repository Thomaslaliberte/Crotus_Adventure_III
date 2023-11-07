extends Node2D



func _ready():
	get_child(2).get_child(3).limit_right = 3300


func _process(delta):
	pass
