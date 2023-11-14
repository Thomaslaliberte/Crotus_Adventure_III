extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.get_node("champignon_anim").play("attaque")
	
	acteur.velocity.x = 0
func Process(_delta):
	print('attaque')
	
	if acteur.get_node('champignon_anim').is_playing() == false:
		
		if acteur.get_node("champignon_anim").flip_h == true:
			acteur.get_node("champi_area_atk_droite").get_node("champi_colli_atk_droite").disabled = false
			
		if acteur.get_node("champignon_anim").flip_h == false:
			acteur.get_node("champi_area_atk_gauche").get_node("champi_colli_atk_gauche").disabled = false
		etat_change.emit('rien')
