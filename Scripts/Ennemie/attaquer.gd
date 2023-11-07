extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D


func Initialisation():
	acteur.get_child(0).play("attaque")
	
func Process(_delta):
	print('attaque')
