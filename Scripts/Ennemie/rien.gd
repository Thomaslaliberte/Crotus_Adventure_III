extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

var choix = 1
var rng = RandomNumberGenerator.new()

func Initialisation():
	acteur.get_node("champi_area_atk_gauche").get_node("champi_colli_atk_gauche").disabled = true
	acteur.get_node("champi_area_atk_droite").get_node("champi_colli_atk_droite").disabled = true
	acteur.timer.stop()
	if acteur.timer.is_stopped():
		acteur.get_child(0).play("idle")
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


func _on_champi_atk_area_body_entered(body):
	if body.is_in_group("joueur"):
		if body.global_position.x <= acteur.global_position.x:
			acteur.get_node("champignon_anim").flip_h = true
			
		else:
			acteur.get_node("champignon_anim").flip_h = false
		etat_change.emit("attaquer")
