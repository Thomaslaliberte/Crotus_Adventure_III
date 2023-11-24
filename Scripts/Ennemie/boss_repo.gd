extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	pass
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	acteur.get_node("boss_anim").play("boss_repos")
