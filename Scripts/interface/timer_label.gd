extends Label

var time = 0
var timer_on = true

func _ready():
	pass 



func _process(delta):
	if timer_on:
		time += delta
		text = var_to_str(time)
	var secs = fmod(time, 60)
	var mins = fmod(secs, 60 * 60) /60
	var time_passe = "time: %02d:%02d" % [mins, secs]
	text = time_passe
