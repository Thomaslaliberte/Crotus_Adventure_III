extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$feu_anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_entered(area):
	if area.is_in_group("presence_crotus"):
		$feu_anim.play("soins")


func _on_area_exited(area):
	$feu_anim.play("default")
