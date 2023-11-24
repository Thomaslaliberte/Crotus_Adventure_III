extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():

	acteur.get_node("champi_area_atk_droite/champi_colli_atk_droite").disabled = true
	acteur.get_node("chami_area/champi_area_zone").disabled = true
	acteur.get_node("champi_atk_area/champi_atk_colli").disabled = true
	acteur.get_node("champi_area_atk_gauche/champi_colli_atk_gauche").disabled = true
	acteur.get_node("champignon_anim").play("champi_mort")
	acteur.collision_layer = false
	
	

func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	acteur.velocity.x = 0
	await get_tree().create_timer(1).timeout
	acteur.queue_free()
