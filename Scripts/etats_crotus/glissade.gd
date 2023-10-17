extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D
var temps = 0
func Initialisation():
	temps = 0
	acteur.get_child(0).play("crotus_slide")
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	var glissade = Input.is_action_just_pressed("glissade")
	
	if acteur.get_child(0).flip_h == false:
		acteur.velocity.x = 1.5*acteur.run_speed
	else:
		acteur.velocity.x = -1.5*acteur.run_speed
		
	temps += 1
	print(temps)
	if temps >= 50:
		etat_change.emit("rien")
	
