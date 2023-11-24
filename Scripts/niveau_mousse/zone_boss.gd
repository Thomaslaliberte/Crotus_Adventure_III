extends Node2D
signal changer_camera

func _on_area_2d_area_entered(area):
	if area.is_in_group("presence_crotus"):
		print("detecter")
		get_node("mur_gauche").get_node("mur_gauche_collision").set_deferred("disabled", false)
		get_child(1).get_child(0).set_deferred("disabled", false)
		changer_camera.emit()
		$Camera2D.enabled = true
