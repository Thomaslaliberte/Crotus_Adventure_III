extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D
var timer = Timer.new()

func Initialisation():
	timer.set_wait_time(0.8) 
	timer.one_shot = true
	self.add_child(timer)
	timer.start()
	acteur.get_child(0).play("crotus_slide")
	
	acteur.get_child(2).set_deferred("disabled", false)
	acteur.get_child(1).set_deferred("disabled", true)
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	var glissade = Input.is_action_just_pressed("glissade")
	
	if acteur.get_child(0).flip_h == false:
		acteur.velocity.x = 1.5*acteur.run_speed
	else:
		acteur.velocity.x = -1.5*acteur.run_speed
	

	if acteur.is_on_wall():
		timer.stop()

	if timer.is_stopped() and acteur.lever == true:
		remove_child(timer)
		etat_change.emit("rien")
	acteur.lever = true


func _on_crotus_body_degat_crotus():
	etat_change.emit("degat")
