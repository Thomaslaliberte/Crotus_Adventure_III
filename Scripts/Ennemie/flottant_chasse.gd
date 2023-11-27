extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

func Initialisation():
	acteur.run_speed = 60
	acteur.get_node("flottant_anim").play("flottant_attaque")
	
	
func Process(_delta):
	
	if acteur.cible.global_position.x < acteur.global_position.x:
		
		acteur.velocity.x = -1*acteur.run_speed
		acteur.get_node("flottant_anim").flip_h = true
		
	elif acteur.cible.global_position.x > acteur.global_position.x:

		acteur.velocity.x = acteur.run_speed
		acteur.get_node("flottant_anim").flip_h = false
		
	else:
		acteur.velocity.x =0
		
	if acteur.cible.global_position.y < acteur.global_position.y:
		acteur.velocity.y = -1*acteur.run_speed

	elif acteur.cible.global_position.y > acteur.global_position.y:
		acteur.velocity.y = acteur.run_speed
		
	else:
		acteur.velocity.y =0

func _on_flottant_attaque_area_body_exited(body):
	if body.is_in_group("joueur") and acteur.vie !=0:
		etat_change.emit("rien")


func _on_flottant_attaque_area_body_entered(body):
	if body.is_in_group("joueur") and acteur.vie !=0:			
		acteur.cible = body
			
		if acteur.cible.vie != 0:
			etat_change.emit("chasse")


func _on_flottant_dmg_area_body_entered(body):
	if body.is_in_group("joueur") and acteur.vie !=0:			
		acteur.cible = body
		etat_change.emit("attaque")

