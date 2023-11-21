extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	pass
	
func Process(_delta):
	print("saut")

	acteur.velocity.y += acteur.jump_speed

	if acteur.is_on_wall() == false:
		acteur.velocity.y += acteur.jump_speed
		etat_change.emit("chasse")
	
