extends "res://Scripts/etats_crotus/etat.gd"

signal fin
signal son_mort
@export var acteur: CharacterBody2D
var timer = Timer.new()
# Called when the node enters the scene tree for the first time.
func Initialisation():
	timer.set_wait_time(3)
	self.add_child(timer)
	timer.one_shot = true
	acteur.get_node('crotus_anim').play("crotus_mort")
	
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta):
	son_mort.emit()
	acteur.velocity.x = 0
	acteur.get_node("crotus_colli_mort").set_deferred("disabled", false)
	acteur.get_child(2).set_deferred("disabled", true)
	acteur.get_child(1).set_deferred("disabled", true)
	acteur.velocity.y += acteur.gravite * _delta
	if acteur.is_on_floor() and timer.is_stopped():
		fin.emit()
		etat_change.emit("rien")


func _on_crotus_body_mort():
	etat_change.emit("mort")
