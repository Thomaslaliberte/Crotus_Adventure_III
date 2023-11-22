extends CharacterBody2D

var run_speed = 50.0
var jump_speed = -20
var timer = Timer.new()
var gravite = 950
var vie = 4

func _ready():
	timer.set_wait_time(3)
	self.add_child(timer)
	timer.one_shot = true
	timer.start()
	
		
func _physics_process(_delta):
	velocity.y += gravite * _delta
	move_and_slide()
	
func _on_squelette_area_attaque_body_entered(body):
	
	if body.global_position.x <= self.global_position.x:
		self.get_node("squelette_area_dmg/squelette_colli_dmg").position.x = -80
	else:
		self.get_node("squelette_area_dmg/squelette_colli_dmg").position.x = -24

		
