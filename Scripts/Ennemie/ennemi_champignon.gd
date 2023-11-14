extends CharacterBody2D


#les vecteurs
var run_speed = 50.0
var timer = Timer.new()
var gravite = 950
func _ready():
	timer.set_wait_time(3)
	self.add_child(timer)
	timer.one_shot = true
	timer.start()
	
	
func _physics_process(_delta):
	velocity.y += gravite * _delta
	move_and_slide()




func _on_chami_area_area_entered(area):
	if area.is_in_group("attaque_crotus"):
		print("thomas")
