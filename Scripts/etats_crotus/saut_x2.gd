extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.velocity.y = 0
	acteur.velocity.y += acteur.jump_speed
	acteur.saut_x2 = 2
	
	acteur.get_child(0).play("crotus_rolade")
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite *_delta
	
	var droite: bool = Input.is_action_pressed("droite")
	var gauche: bool = Input.is_action_pressed("gauche")
	
	if droite or gauche:
		etat_change.emit("course") 
	if acteur.is_on_floor():
		etat_change.emit("rien")
