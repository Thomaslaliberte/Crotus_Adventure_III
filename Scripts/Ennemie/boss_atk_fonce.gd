extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

var timer_fonce = Timer.new()
var atk_fonce = false
func Initialisation():
	
	timer_fonce.set_wait_time(3)
	timer_fonce.one_shot = true
	self.add_child(timer_fonce)
	timer_fonce.start()
	
	atk_fonce = false
	
	acteur.get_node("boss_anim").play("boss_atk_fonce_1")
	
	if acteur.cible.global_position.x < acteur.global_position.x:
		acteur.get_node("boss_anim").flip_h = true
		
	elif acteur.cible.global_position.x > acteur.global_position.x:
		acteur.get_node("boss_anim").flip_h = false
	
	
	
func Process(_delta):
	
	if timer_fonce.is_stopped() and !atk_fonce:
		atk_fonce = true
		acteur.get_node("boss_anim").play("boss_frame_aide")
	
	if atk_fonce and acteur.get_node("boss_anim").is_playing() == false:
		acteur.get_node("boss_anim").play("boss_atk_fonce_2")
		acteur.get_node("atk_fonce_area/atk_fonce_colli").disabled = false
		
		atk_fonce = true
		if acteur.cible.global_position.x < acteur.global_position.x:
			acteur.get_node("boss_anim").flip_h = true
			acteur.velocity.x = -10*acteur.run_speed
			
		elif acteur.cible.global_position.x > acteur.global_position.x:
			acteur.get_node("boss_anim").flip_h = false
			acteur.velocity.x = 10*acteur.run_speed
	
	if acteur.is_on_wall() and atk_fonce:
		acteur.get_node("atk_fonce_area/atk_fonce_colli").disabled = true
		remove_child(timer_fonce)
		etat_change.emit("rien")
		

