extends Area2D

func _ready():
	pass
signal glissade

func _process(delta):
	#pour ne pas recevoir d'avertissement
	delta = delta
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			glissade.emit()
			queue_free();



func _on_foret_niv_1_cacher():
	queue_free()
