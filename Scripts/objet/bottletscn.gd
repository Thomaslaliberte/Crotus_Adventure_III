extends Area2D

func _ready():
	pass
signal glissade

func _process(delta):
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			glissade.emit()
			queue_free();




func _on_main_cacher_bouteille():
	queue_free()

