extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.velocity.y += acteur.jump_speed
	acteur.get_child(0).play("crotus_en_air")
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	var sauter: bool = Input.is_action_just_pressed("sauter")
	var attaque: bool = Input.is_action_just_pressed("attaque")
	
	if sauter:
		if acteur.saut_x2 == 1:
			etat_change.emit("saut_x2")

	if droite or gauche:
		etat_change.emit("course") 
	if acteur.is_on_floor():
		etat_change.emit("rien")

	if attaque:
		etat_change.emit("attaque")
