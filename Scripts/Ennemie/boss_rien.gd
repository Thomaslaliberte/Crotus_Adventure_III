extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

var choix = 1
var rng = RandomNumberGenerator.new()

func Initialisation():
	acteur.get_node("atk_plonge2_area/atk_plonge2_colli").disabled = true
	
	acteur.timer.stop()
	if acteur.timer.is_stopped():
		acteur.get_node("boss_anim").play("boss_rien")
	acteur.velocity.x = 0
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	
	if acteur.timer.is_stopped() and acteur.vie !=0 and acteur.cible.vie != 0:
		_on_timer_timeout()
	if choix == 2:
		etat_change.emit('atk_plonge')
	
	if choix == 3:
		etat_change.emit('atk_multi')
		
	if choix == 4:
		etat_change.emit('atk_vague')
		
	if choix == 5:
		etat_change.emit('atk_fonce')
		
		

func _on_timer_timeout():
	choix = rng.randi_range(1, 5)
	acteur.timer.start()


func _on_tempo_area_body_entered(body):
	
	if body.is_in_group("joueur"):
		acteur.cible = body


func _on_boss_dmg_area_area_entered(area):
	if area.is_in_group("attaque_crotus"):
		acteur.vie -=1
	
	if acteur.vie == 0:
		etat_change.emit("mort")
		
