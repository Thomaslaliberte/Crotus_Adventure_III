extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	
	if acteur.is_on_wall() == false:
		acteur.get_node("squelette_anim").play("squelette_courrir")
	acteur.get_node("squelette_anim").flip_h = true
	
func Process(_delta):
	acteur.velocity.x = -1*acteur.run_speed
	
	if acteur.timer.time_left == 0:
		etat_change.emit("rien")
		
	if acteur.is_on_wall():
		acteur.timer.stop()
		etat_change.emit("rien")
