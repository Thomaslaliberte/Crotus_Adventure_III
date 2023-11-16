extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D
var timer = Timer.new()
# Called when the node enters the scene tree for the first time.
func Initialisation():
	acteur.velocity.x = 0
	timer.set_wait_time(0.4)
	self.add_child(timer)
	timer.one_shot = true
	timer.start()
	acteur.get_child(0).play("crotus_saut_fin")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	if timer.is_stopped() or acteur.is_on_floor():
		etat_change.emit("rien")

func _on_crotus_body_degat_crotus(area):
	acteur.velocity.y += acteur.jump_speed/2
	if area.global_position.x <= acteur.global_position.x:
		acteur.velocity.x += acteur.run_speed
			
	else:
		acteur.velocity.x += -acteur.run_speed
	
	
	
