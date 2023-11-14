extends "res://Scripts/etats_crotus/etat.gd"
 
@export var acteur: CharacterBody2D
 
# Called when the node enters the scene tree for the first time.
func Initialisation():
	acteur.get_child(0).play("crotus_crouch_debut")
	acteur.velocity.x = 0
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	
	var sauter: bool = Input.is_action_just_pressed("sauter")
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	var bas : bool = Input.is_action_pressed("bas")
	var attaque: bool = Input.is_action_just_pressed("attaque")
	if bas:
		if droite or gauche:
			etat_change.emit("marche_acroupie")
		if sauter:
			etat_change.emit("sauter")
	else:
		etat_change.emit("rien")
	if attaque:
		etat_change.emit("attaque")
