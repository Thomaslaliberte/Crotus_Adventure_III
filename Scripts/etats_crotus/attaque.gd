extends "res://Scripts/etats_crotus/etat.gd"

@export var acteur: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func Initialisation():
	acteur.get_node('crotus_anim').play("crotus_atk_01")
	if acteur.velocity.x != 0:
		acteur.velocity.x = acteur.velocity.x/2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta):
	acteur.velocity.y += acteur.gravite * _delta
	
	if acteur.get_node('crotus_anim').flip_h == true:
		acteur.get_node("attaque_droite_zone").get_child(0).disabled = false
	else:
		acteur.get_node("attaque_gauche_zone").get_child(0).disabled = false

	if acteur.get_node('crotus_anim').is_playing() == false:
		acteur.get_node("attaque_droite_zone").get_child(0).disabled = true
		acteur.get_node("attaque_gauche_zone").get_child(0).disabled = true
		etat_change.emit("rien")
