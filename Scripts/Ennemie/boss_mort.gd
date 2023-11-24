extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("boss_anim").play("boss_mort")
	acteur.get_node("atk_plonge2_area/atk_plonge2_colli").disabled = true
	acteur.get_node("atk_multi_area/atk_multi_colli").disabled = true
	acteur.get_node("atk_multi_area/atk_multi_colli").disabled = true
	
	

func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	acteur.velocity.x = 0
	
	if acteur.get_node("boss_anim").is_playing() == false:
		queue_free()
