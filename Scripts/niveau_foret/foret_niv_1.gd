extends Node2D

signal envoyer_lever
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_glissade_area_2d_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_2_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_3_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_4_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_5_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_6_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_7_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_8_lever():
	envoyer_lever.emit()
