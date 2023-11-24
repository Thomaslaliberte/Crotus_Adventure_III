extends Area2D

func _ready():
	pass
signal double_saut

func _process(delta):
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			double_saut.emit()
			queue_free();





func _on_mossy_niv_2_cacher():
	queue_free()
