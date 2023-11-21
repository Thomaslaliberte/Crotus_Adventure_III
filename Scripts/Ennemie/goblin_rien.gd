extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

var choix = 1
var rng = RandomNumberGenerator.new()

func Initialisation():
	acteur.timer.stop()
	acteur.run_speed = 70
	
	if acteur.timer.is_stopped():
		acteur.get_node("goblin_anim").play("goblin_rien")
		
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

