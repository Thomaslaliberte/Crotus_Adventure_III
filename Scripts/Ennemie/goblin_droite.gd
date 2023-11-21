extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():

	if acteur.is_on_wall() == false:
		acteur.get_node("goblin_anim").play("goblin_courrir")
	acteur.get_node("goblin_anim").flip_h = false	
	
func Process(_delta):
	acteur.velocity.x = acteur.run_speed

	if acteur.timer.time_left == 0:
		etat_change.emit("rien")
	
	if acteur.is_on_wall():
		acteur.timer.stop()
		etat_change.emit("rien")
