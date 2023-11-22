extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

var timer_dmg = Timer.new()

func Initialisation():
	acteur.vie -= 1
	
	timer_dmg.set_wait_time(0.5)
	self.add_child(timer_dmg)
	timer_dmg.one_shot = true
	timer_dmg.start()
	
	acteur.get_node("flottant_anim").play("flottant_touche")
	
func Process(_delta):
	
	if acteur.vie ==0:
		etat_change.emit("mort")
	
	elif timer_dmg.is_stopped():
		etat_change.emit("chasse")
	
	

func _on_flottant_dmg_area_area_entered(area):
	
	if area.is_in_group("attaque_crotus"):
		acteur.velocity.y += acteur.jump_speed/2
		if area.global_position.x <= acteur.global_position.x:
			acteur.velocity.x += acteur.run_speed
		else:
			acteur.velocity.x += -acteur.run_speed
	
		etat_change.emit("degat")
		
