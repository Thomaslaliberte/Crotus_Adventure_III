extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

var choix = 1
var rng = RandomNumberGenerator.new()

func Initialisation():
	acteur.get_node("squelette_area_dmg/squelette_colli_dmg").disabled = true
	acteur.timer.stop()
	
	if acteur.timer.is_stopped():
		acteur.get_node("squelette_anim").play("squelette_rien")
		
	acteur.velocity.x = 0

func Process(_delta):
	if acteur.timer.is_stopped():
		_on_timer_timeout()
	
	if choix == 2:
		etat_change.emit('droite')
	
	if choix == 3:
		etat_change.emit('gauche')
		
	

func _on_timer_timeout():
	choix = rng.randi_range(1, 3)
	acteur.timer.start()

func _on_squelette_area_attaque_body_entered(body):
	if body.is_in_group("joueur"):
		if body.global_position.x <= acteur.global_position.x:
			acteur.get_node("squelette_anim").flip_h = true
			acteur.get_node("squelette_area_dmg/squelette_colli_dmg").position.x = -80
			
		else:
			acteur.get_node("squelette_anim").flip_h = false
			acteur.get_node("squelette_area_dmg/squelette_colli_dmg").position.x = -24
				
		if body.vie != 0 or acteur.vie !=0:
			etat_change.emit("attaque_epee")

