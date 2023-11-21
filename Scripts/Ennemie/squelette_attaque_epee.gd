extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

var timer = Timer.new()
var dernier_atk

func Initialisation():
	
	dernier_atk = false
	acteur.get_node("squelette_anim").play("squelette_attaque")
	acteur.velocity.x = 0
	timer.set_wait_time(0.1)
	timer.one_shot = true
	self.add_child(timer)
	timer.start()
			
	
func Process(_delta):
	if timer.is_stopped():
		acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = true

func _on_squelette_anim_animation_finished():

	acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = false
	
	if dernier_atk:
		etat_change.emit("rien")
	else:
		Initialisation()

func _on_squelette_area_attaque_body_exited(body):
		dernier_atk = true


