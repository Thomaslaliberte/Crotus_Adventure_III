extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D

var choix = 1
var rng = RandomNumberGenerator.new()

func Initialisation():
	acteur.get_node("atk_plonge2_area/atk_plonge2_colli").set_deferred("disabled", true)
	
	choix = 1
	if choix ==1:
		acteur.get_node("boss_anim").play("boss_rien")
	acteur.velocity.x = 0
	
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	
	if acteur.timer.is_stopped() and acteur.vie !=0:
		_on_timer_timeout()
	elif choix == 2:
		etat_change.emit('atk_plonge')
	
	elif choix == 3:
		etat_change.emit('atk_multi')
		
	elif choix == 4:
		etat_change.emit('atk_vague')
		
	elif choix == 5:
		etat_change.emit('atk_fonce')
		
	if acteur.cible.vie == 0:
		etat_change.emit("repos")

func _on_timer_timeout():
	choix = rng.randi_range(1, 5)
	acteur.timer.start()

func _on_tempo_area_body_entered(body):
	if body.is_in_group("joueur"):
		acteur.cible = body
		acteur.get_node("tempo_area").queue_free()
		etat_change.emit("rien")


func _on_boss_dmg_area_area_entered(area):
	if area.is_in_group("attaque_crotus"):
		acteur.vie -=1
	
	if acteur.vie == 0:
		etat_change.emit("mort")
		
