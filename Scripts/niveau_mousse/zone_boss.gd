extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("presence_crotus"):
		print("detecter")
		get_node("mur_gauche").get_node("mur_gauche_collision").set_deferred("disabled", false)
		get_child(1).get_child(0).set_deferred("disabled", false)
