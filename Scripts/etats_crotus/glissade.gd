extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D
var temps = 0
func Initialisation():
	temps = 0
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
	
	print(temps)
	if acteur.is_on_wall():
		temps = 50

	if temps >= 50:
		print(acteur.lever)
		if !acteur.lever:
			temps = 49
		else:	
			etat_change.emit("rien")
	temps += 1
	acteur.lever = true
