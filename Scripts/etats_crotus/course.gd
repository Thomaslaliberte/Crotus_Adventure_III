extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	pass
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	if acteur.is_on_floor():
		acteur.get_child(0).play("crotus_course")
	
	var sauter: bool = Input.is_action_just_pressed("sauter")
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	var droite_fin: bool = Input.is_action_just_released("droite")
	var gauche_fin: bool = Input.is_action_just_released("gauche")
	var glissade = Input.is_action_just_pressed("glissade")
	var acroupie: bool = Input.is_action_just_pressed("bas")
	var attaque: bool = Input.is_action_just_pressed("attaque")
	
	if droite:
		acteur.velocity.x = acteur.run_speed
		acteur.get_child(0).flip_h = false	
	if gauche:
		acteur.velocity.x = -1*acteur.run_speed
		acteur.get_child(0).flip_h = true
	
	if sauter:
		if acteur.is_on_floor():
			etat_change.emit("saut")
		elif acteur.saut_x2 == 1:
			etat_change.emit("saut_x2")

	if acteur.glissade == true:
		if glissade:
			if acteur.is_on_floor():
				etat_change.emit("glissade")
	
	if droite_fin or gauche_fin:
		acteur.velocity.x = 0
		if acteur.is_on_floor():
			etat_change.emit("rien")
		else:
			etat_change.emit("en_air")
			
	if acroupie:
		if acteur.is_on_floor():
			etat_change.emit("acroupie")
	if attaque:
		etat_change.emit("attaque")


func _on_crotus_body_degat_crotus():
	etat_change.emit("degat")
