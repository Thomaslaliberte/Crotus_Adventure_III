extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("goblin_area_attaque/goblin_colli_attaque").disabled = true
	acteur.get_node("goblin_area_dmg/goblin_colli_dmg").disabled = true
	acteur.get_node("goblin_area_touche/goblin_colli_touche").disabled = true
	acteur.get_node("goblin_anim").play("goblin_mort")
	acteur.collision_layer = false
	
	

func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	acteur.velocity.x = 0
