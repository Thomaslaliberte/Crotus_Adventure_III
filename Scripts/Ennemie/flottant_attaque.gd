extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D
var timer_attaque = Timer.new()

func Initialisation():
	timer_attaque.set_wait_time(0.3)
	self.add_child(timer_attaque)
	timer_attaque.one_shot = true
	timer_attaque.start()
	

func Process(_delta):
	
	if timer_attaque.is_stopped():
		_on_timer_attaque_timeout()
	
	if acteur.cible.global_position.x < acteur.global_position.x:
		acteur.velocity.x = acteur.run_speed
			
	elif acteur.cible.global_position.x > acteur.global_position.x:
		acteur.velocity.x = -acteur.run_speed
		
	if acteur.cible.global_position.y < acteur.global_position.y:
		acteur.velocity.y = -acteur.jump_speed

	elif acteur.cible.global_position.y > acteur.global_position.y:
		acteur.velocity.y = acteur.jump_speed
		
func _on_timer_attaque_timeout():
	acteur.velocity.y = 0
	acteur.velocity.x = 0
	etat_change.emit("chasse")
