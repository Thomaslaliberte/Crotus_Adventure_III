extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func Initialisation():
	acteur.get_child(0).play("crotus_crouch_walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	var sauter: bool = Input.is_action_just_pressed("sauter")
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	var droite_fin: bool = Input.is_action_just_released("droite")
	var gauche_fin: bool = Input.is_action_just_released("gauche")
	var glissade = Input.is_action_just_pressed("glissade")
	var bas : bool = Input.is_action_pressed("bas")
	var attaque: bool = Input.is_action_just_pressed("attaque")
	if bas:
		if droite:
			acteur.velocity.x = acteur.run_speed/2
			acteur.get_child(0).flip_h = false	
		if gauche:
			acteur.velocity.x = -1*acteur.run_speed/2
			acteur.get_child(0).flip_h = true
	
		if sauter:
			if acteur.is_on_floor():
				etat_change.emit("saut")

		if acteur.glissade == true:
			if glissade:
				if acteur.is_on_floor():
					etat_change.emit("glissade")
	
		if droite_fin or gauche_fin:
			if acteur.is_on_floor():
				etat_change.emit("acroupie")
			else:
				etat_change.emit("en_air")
		
		if acteur.is_on_floor() == false:
			etat_change.emit("en_air")
		if attaque:
			etat_change.emit("attaque")
	else:
		etat_change.emit("rien")
