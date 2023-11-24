extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("flottant_dmg_area/flottant_dmg_colli").disabled = true
	acteur.get_node("flottant_attaque_area/flottant_attaque_colli").disabled = true
	acteur.get_node("flottant_anim").play("flottant_mort")
	acteur.collision_layer = false
	
	

func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	if acteur.is_on_floor():
		acteur.get_node("flottant_anim").play("flottant_crepe")
		await get_tree().create_timer(1).timeout
		acteur.queue_free()
