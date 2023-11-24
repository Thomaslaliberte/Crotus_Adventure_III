extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D


var atk_fini = false

func Initialisation():
	acteur.velocity.y += acteur.jump_speed/5
	acteur.get_node("boss_anim").play("boss_atk_multi_1")
	
	if acteur.cible.global_position.x < acteur.global_position.x:
		acteur.velocity.x = -2*acteur.run_speed
		acteur.get_node("boss_anim").flip_h = true
		
	elif acteur.cible.global_position.x > acteur.global_position.x:
		acteur.velocity.x = 2*acteur.run_speed
		acteur.get_node("boss_anim").flip_h = false
	
	atk_fini = false
	acteur.get_node("atk_multi_area/atk_multi_colli").disabled = false
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	if acteur.get_node("boss_anim").is_playing() == false and atk_fini:
		acteur.get_node("atk_multi_area/atk_multi_colli").disabled = true
		etat_change.emit("rien")
	
	if acteur.get_node("boss_anim").is_playing() == false:
		
		atk_fini = true
		acteur.velocity.y += acteur.jump_speed/5
		acteur.get_node("boss_anim").play("boss_atk_multi_2")
		
		if acteur.cible.global_position.x < acteur.global_position.x:
			acteur.velocity.x = -acteur.run_speed
			acteur.get_node("boss_anim").flip_h = true
		
		elif acteur.cible.global_position.x > acteur.global_position.x:
			acteur.velocity.x = acteur.run_speed
			acteur.get_node("boss_anim").flip_h = false
			
		

