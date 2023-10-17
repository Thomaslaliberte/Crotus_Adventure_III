extends "res://scripts/etat.gd"

@export var acteur: CharacterBody2D

func Initialisation():
	acteur.velocity.y = acteur.gravite

func Process(_delta):
	var sauter: bool = Input.is_action_just_pressed("saut")
	
	if sauter:
		if acteur.is_on_floor():
			etat_change.emit("EtatSaut")
