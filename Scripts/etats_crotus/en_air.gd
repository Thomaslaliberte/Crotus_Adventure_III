extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_child(0).play("crotus_saut_fin")


func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	
	if droite or gauche:
		etat_change.emit("course") 
	if acteur.is_on_floor():
		etat_change.emit("rien")	
