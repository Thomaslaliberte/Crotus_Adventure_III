extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("flottant_anim").flip_h = false	
	
func Process(_delta):
	acteur.velocity.x = -1*acteur.run_speed

	if acteur.timer.time_left == 0:
		etat_change.emit("rien")
	
	if acteur.is_on_wall():
		acteur.timer.stop()
		etat_change.emit("rien")
