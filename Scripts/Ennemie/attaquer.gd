extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D
var timer = Timer.new()
func Initialisation():
	acteur.get_node("champignon_anim").play("attaque")
	timer.set_wait_time(0.8)
	timer.one_shot = true
	self.add_child(timer)
	timer.start()	
	acteur.velocity.x = 0
func Process(_delta):
	
	if acteur.get_node('champignon_anim').is_playing() == false:
		
		if acteur.get_node("champignon_anim").flip_h == false:
			acteur.get_node("champi_area_atk_droite").get_node("champi_colli_atk_droite").disabled = false
			
		if acteur.get_node("champignon_anim").flip_h == true:
			acteur.get_node("champi_area_atk_gauche").get_node("champi_colli_atk_gauche").disabled = false
		
	if timer.is_stopped():
		acteur.get_node("champi_area_atk_gauche").get_node("champi_colli_atk_gauche").disabled = true
		acteur.get_node("champi_area_atk_droite").get_node("champi_colli_atk_droite").disabled = true
		remove_child(timer)
		etat_change.emit('rien')
