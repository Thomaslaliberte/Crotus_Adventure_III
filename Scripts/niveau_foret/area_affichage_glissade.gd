extends Area2D

signal cacher_affichage_glissade

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pour ne pas recevoir d'avertissement
	delta = delta
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			cacher_affichage_glissade.emit()
