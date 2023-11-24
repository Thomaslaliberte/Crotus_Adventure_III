extends Area2D

signal cacher_affichage_feu
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pour ne pas recevoir d'avertissement
	delta = delta
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			cacher_affichage_feu.emit()
