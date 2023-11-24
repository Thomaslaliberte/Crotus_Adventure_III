extends CharacterBody2D


var speed = 1750

func _lance(_position, _direction):
	rotation = _direction
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	move_and_collide(velocity * delta)
	
func _on_projectile_degat_area_body_entered(body):
	if body.is_in_group("boss") == false:
		queue_free()
		
