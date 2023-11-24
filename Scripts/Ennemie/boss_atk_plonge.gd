extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

var timer_plonge = Timer.new()
var plonge = false

func Initialisation():
	timer_plonge.set_wait_time(3)
	timer_plonge.one_shot = true
	self.add_child(timer_plonge)
	timer_plonge.start()
	
	plonge = false
	
	acteur.velocity.y += acteur.jump_speed
	acteur.get_node("boss_anim").play("boss_atk_plonge_1")
	
	if acteur.is_on_ceiling():
		acteur.velocity.y = 0
func Process(_delta):

	if timer_plonge.is_stopped() and !plonge:
		acteur.get_node("boss_anim").stop()
		acteur.get_node("boss_anim").play("boss_atk_plonge_2")
		plonge = true
	
	if plonge:
		acteur.velocity.y += 20*acteur.gravite * _delta
		
	else:
		
		if acteur.cible.global_position.x < acteur.global_position.x:

			acteur.velocity.x = -1*acteur.run_speed
		
			acteur.get_node("boss_anim").flip_h = true
		
		elif acteur.cible.global_position.x > acteur.global_position.x:

			acteur.velocity.x = acteur.run_speed

			acteur.get_node("boss_anim").flip_h = false
			
	if acteur.is_on_floor():
				
		acteur.get_node("atk_plonge2_area/atk_plonge2_colli").disabled = false
		
	if acteur.get_node("boss_anim").is_playing() == false:
		etat_change.emit("rien")



	

	
