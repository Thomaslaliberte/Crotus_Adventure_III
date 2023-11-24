extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():

	acteur.get_node("squelette_area_attaque/squelette_colli_attaque").disabled = true
	acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = true
	acteur.get_node("squelette_area_touche/squelette_colli_touche").disabled = true
	acteur.get_node("squelette_anim").play("squelette_mort")
	acteur.collision_layer = false
	
	

func Process(_delta):
	acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = true
	acteur.velocity.y += acteur.gravite * _delta
	acteur.velocity.x = 0
	await get_tree().create_timer(1).timeout
	acteur.queue_free()
