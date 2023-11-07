extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

var choix = 1
var rng = RandomNumberGenerator.new()

func Initialisation():
	if acteur.timer.is_stopped():
		acteur.get_child(0).play("idle")
	acteur.velocity.x = 0
	
func Process(_delta):
	if acteur.timer.time_left == 0:
		Nouvelle_action()

	if choix == 2:
		etat_change.emit('droite')
	
	if choix == 3:
		etat_change.emit('gauche')

func Nouvelle_action():
	choix = rng.randi_range(1, 3)
	acteur.timer.start()


func _on_champi_atk_area_body_entered(body):
	if body.is_in_group("joueur"):
		if body.global_position.x < acteur.global_position.x:
			acteur.get_child(0).flip_h = true
		etat_change.emit("attaquer")
