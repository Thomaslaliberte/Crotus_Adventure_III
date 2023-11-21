extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

func Initialisation():
	
	if acteur.is_on_wall() == false:
		acteur.get_node("goblin_anim").play("goblin_courrir")
	acteur.get_node("goblin_anim").flip_h = true
	
func Process(_delta):
	acteur.velocity.x = -1*acteur.run_speed
	
	acteur.velo
