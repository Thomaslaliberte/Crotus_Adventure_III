extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

func Initialisation():
	
	acteur.get_node("squelette_anim").play("squelette_attaque")
	acteur.velocity.x = 0
	print("attaque")
	
func Process(_delta):
	pass

func _on_squelette_anim_animation_finished():
	
	Initialisation()

func _on_squelette_area_attaque_body_exited(body):
	
	if body.is_in_group("joueur"):
		etat_change.emit("rien")


