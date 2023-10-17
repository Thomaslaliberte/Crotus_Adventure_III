extends Area2D

func _ready():
	pass


func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("joueur"):
			print("bouteil")
			get_parent().get_node("crotus_body").glissade = true
			queue_free();


