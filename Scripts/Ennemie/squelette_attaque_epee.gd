extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

var timer_attaque = Timer.new()
var dernier_atk

func Initialisation():
	
	dernier_atk = false
	acteur.get_node("squelette_anim").play("squelette_attaque")
	acteur.velocity.x = 0
	timer_attaque.set_wait_time(1)
	timer_attaque.one_shot = true
	self.add_child(timer_attaque)
	timer_attaque.start()
			
	
func Process(_delta):
	if timer_attaque.is_stopped():
		acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = true
		
		

func _on_squelette_anim_animation_finished():

	acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = false
	print(acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled)
	
	if dernier_atk and acteur.vie !=0:
		etat_change.emit("rien")
	elif acteur.vie !=0:
		Initialisation()

func _on_squelette_area_attaque_body_exited(body):
		dernier_atk = true


