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

	
	if sauter:
		if acteur.saut_x2 == 1:
			etat_change.emit("saut_x2")

	if droite or gauche:
		etat_change.emit("course") 
	if acteur.is_on_floor():
		etat_change.emit("rien")



func _on_crotus_body_degat_crotus(area):
	etat_change.emit("degat")


func _on_crotus_body_mort():
	etat_change.emit("mort")
