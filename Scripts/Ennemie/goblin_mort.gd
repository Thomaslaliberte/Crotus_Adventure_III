extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("goblin_area_attaque/goblin_colli_attaque").set_deferred("disabled", true)
	acteur.get_node("goblin_area_dmg/goblin_colli_dmg").set_deferred("disabled", true)
	acteur.get_node("goblin_area_touche/goblin_colli_touche").set_deferred("disabled", true)
	acteur.get_node("goblin_anim").play("goblin_mort")
	acteur.collision_layer = false
	
	

func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	acteur.velocity.x = 0
	await get_tree().create_timer(1).timeout
	acteur.queue_free()
