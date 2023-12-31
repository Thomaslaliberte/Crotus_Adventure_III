extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

func Initialisation():
	acteur.run_speed = 110
	acteur.get_node("goblin_anim").play("goblin_attaque")
	acteur.get_node("goblin_area_dmg/goblin_colli_dmg").set_deferred("disabled", false)
	
func Process(_delta):
	

	if acteur.cible.global_position.x +15 < acteur.global_position.x -15:

		acteur.velocity.x = -1*acteur.run_speed
		acteur.get_node("goblin_area_dmg/goblin_colli_dmg").scale.x =-1
		
		acteur.get_node("goblin_anim").flip_h = true
		
	elif acteur.cible.global_position.x +15 > acteur.global_position.x -15:

		acteur.velocity.x = acteur.run_speed
		acteur.get_node("goblin_area_dmg/goblin_colli_dmg").scale.x = 1

		acteur.get_node("goblin_anim").flip_h = false
		
	else:
		acteur.velocity.x =0

	if acteur.is_on_wall():
		
		etat_change.emit("saut")
	

func _on_goblin_area_attaque_body_exited(body):
	if body.is_in_group("joueur"):
		if acteur.vie !=0:
			etat_change.emit("rien")


func _on_goblin_area_attaque_body_entered(body):
	if body.is_in_group("joueur") and acteur.vie != 0:			
		acteur.cible = body
		
		if acteur.cible.vie != 0:
			etat_change.emit("chasse")
