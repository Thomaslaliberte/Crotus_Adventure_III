extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$feu_anim.play("default")


func _on_area_entered(area):
	if area.is_in_group("presence_crotus"):
		$feu_anim.play("soins")


func _on_area_exited(area):
	#pour ne pas recevoir d'avertissement
	area = area
	$feu_anim.play("default")
