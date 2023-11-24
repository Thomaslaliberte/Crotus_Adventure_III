extends "res://Scripts/etats_crotus/etat.gd"


@export var acteur: CharacterBody2D
var projectile = preload("res://Scenes/ennemis/boss_projectile_2d.tscn")

var timer_vague = Timer.new()
var atk_vague = false
func Initialisation():
	
	timer_vague.set_wait_time(3)
	timer_vague.one_shot = true
	self.add_child(timer_vague)
	timer_vague.start()
	
	atk_vague = false
	
	if acteur.cible.global_position.x < acteur.global_position.x:
		acteur.get_node("boss_anim").flip_h = true
		
	elif acteur.cible.global_position.x > acteur.global_position.x:
		acteur.get_node("boss_anim").flip_h = false
	
	acteur.get_node("boss_anim").play("boss_atk_vague_1")
	
func Process(_delta):
	
	if timer_vague.is_stopped() and atk_vague:
		etat_change.emit("rien")
	
	if timer_vague.is_stopped() and !atk_vague:
		atk_vague = true
		
	if atk_vague:
		acteur.get_node("boss_anim").play("boss_atk_vague_2")
		
		if acteur.cible.global_position.x < acteur.global_position.x:
			acteur.get_node("boss_anim").flip_h = true
			_lance_dague(3.14159)
		elif acteur.cible.global_position.x > acteur.global_position.x:
			acteur.get_node("boss_anim").flip_h = false
			_lance_dague(0)
		
func _lance_dague(_cote):
	var dague = projectile.instantiate()
	get_tree().root.add_child(dague)
	dague._lance(acteur.marker.global_position, _cote + acteur.marker.rotation )
