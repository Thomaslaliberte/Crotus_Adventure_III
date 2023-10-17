extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	print("rien")
	acteur.get_child(0).play("crotus_rien")
	acteur.velocity.x = 0
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	var sauter: bool = Input.is_action_just_pressed("sauter")
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	var glissade = Input.is_action_just_pressed("glissade")
	
	if droite or gauche:
		etat_change.emit("course")
		
	if sauter:
		if acteur.is_on_floor():
			etat_change.emit("saut")
	
	if acteur.glissade == true:
		if glissade:
			if acteur.is_on_floor():
				etat_change.emit("glissade")
