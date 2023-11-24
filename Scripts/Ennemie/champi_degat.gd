extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

var timer_dmg = Timer.new()

func Initialisation():

	acteur.vie -= 1
	
	timer_dmg.set_wait_time(0.1)
	timer_dmg.one_shot = true
	self.add_child(timer_dmg)
	timer_dmg.start()
	
	acteur.get_node("champignon_anim").play("champi_degat")
	
func Process(_delta):
	
	if acteur.vie == 0:
		remove_child(timer_dmg)
		etat_change.emit("mort")
		
	elif timer_dmg.is_stopped():
		remove_child(timer_dmg)
		etat_change.emit("rien")
	

func _on_chami_area_area_entered(area):
	if area.is_in_group("attaque_crotus"):
		acteur.velocity.y += acteur.jump_speed/2
		
		if area.global_position.x <= acteur.global_position.x:
			acteur.velocity.x += acteur.run_speed
		else:
			acteur.velocity.x += -acteur.run_speed
	
		etat_change.emit("degat")

