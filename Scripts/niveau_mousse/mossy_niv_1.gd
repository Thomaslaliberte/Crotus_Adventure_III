extends Node2D

var afficher_feu = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("didactiel_feu").get_node("area_affichage_feu"):
		get_node("didactiel_feu").get_node("area_affichage_feu").cacher_affichage_feu.connect(_on_area_mouvement_cacher_affichage_feu)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pour ne pas recevoir d'avertissement
	delta = delta
	if get_node("didactiel_feu").get_node("affichage_feu").visible == true and afficher_feu == false:
		get_node("didactiel_feu").get_node("affichage_feu").visible = false
	else:
		afficher_feu = false


func _on_area_mouvement_cacher_affichage_feu():
	get_node("didactiel_feu").get_node("affichage_feu").visible = true
	afficher_feu = true
