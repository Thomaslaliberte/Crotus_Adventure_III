extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("attaque_droite_zone").get_child(0).disabled = true
	acteur.get_node("attaque_gauche_zone").get_child(0).disabled = true
	if acteur.is_on_floor():
		acteur.get_child(0).play("crotus_rien")
		acteur.velocity.x = 0
	acteur.get_node("crotus_colli_mort").set_deferred("disabled", true)
	acteur.get_child(2).set_deferred("disabled", true)
	acteur.get_child(1).set_deferred("disabled", false)
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	
	var sauter: bool = Input.is_action_just_pressed("sauter")
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	var glissade = Input.is_action_just_pressed("glissade")
	var acroupie: bool = Input.is_action_pressed("bas")
	var attaque: bool = Input.is_action_just_pressed("attaque")
	
	if acteur.is_on_floor() == false:
		etat_change.emit("en_air")
	
	if droite or gauche:
		etat_change.emit("course")
		
	if sauter:
		etat_change.emit("saut")
	
	if acteur.glissade == true:
		if glissade:
			etat_change.emit("glissade")
	if acroupie:
		if acteur.is_on_floor():
			etat_change.emit("acroupie")
	if attaque:
		etat_change.emit("attaque")
	
	



func _on_crotus_body_faire_rien():
	etat_change.emit("rien")
