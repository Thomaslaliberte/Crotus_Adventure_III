extends Node2D
var affichage_double_saut = false
var cacher_saut = false
signal cacher
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("didactiel_double_saut").get_node("area_affichage_double_saut"):
		get_node("didactiel_double_saut").get_node("area_affichage_double_saut").cacher_affichage_double_saut.connect(_on_area_mouvement_cacher_affichage_double_saut)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pour ne pas recevoir d'avertissement
	delta = delta
	if cacher_saut == true:
		cacher.emit()
		cacher_saut = false
	
	if get_node("didactiel_double_saut").get_node("affichage_double_saut").visible == true and affichage_double_saut == false:
		get_node("didactiel_double_saut").get_node("affichage_double_saut").visible = false
	else:
		affichage_double_saut = false


func _on_area_mouvement_cacher_affichage_double_saut():
	get_node("didactiel_double_saut").get_node("affichage_double_saut").visible = true
	affichage_double_saut = true
