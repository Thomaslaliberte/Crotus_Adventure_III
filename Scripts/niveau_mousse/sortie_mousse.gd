extends Area2D

signal sortie_mousse
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			sortie_mousse.emit()