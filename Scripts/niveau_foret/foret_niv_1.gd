extends Node2D

signal envoyer_lever
signal cacher
var cacher_bouteille = false
var affichage_mouvement = false
var afficher_saut = false
var afficher_attaque = false
var afficher_glissade = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("mouvement").get_node("area_mouvement"):
		get_node("mouvement").get_node("area_mouvement").cacher_affichage_mouvement.connect(_on_area_mouvement_cacher_affichage_mouvement)
	
	if get_node("didactiel_saut").get_node("area_affichage_saut"):
		get_node("didactiel_saut").get_node("area_affichage_saut").cacher_affichage_saut.connect(_on_area_mouvement_cacher_affichage_saut)
	
	if get_node("didactiel_attaque").get_node("area_affichage_attaque"):
		get_node("didactiel_attaque").get_node("area_affichage_attaque").cacher_affichage_attaque.connect(_on_area_mouvement_cacher_affichage_attaque)
	
	if get_node("didactiel_glissade").get_node("area_affichage_glissade"):
		get_node("didactiel_glissade").get_node("area_affichage_glissade").cacher_affichage_glissade.connect(_on_area_mouvement_cacher_affichage_glissade)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pour ne pas recevoir d'avertissement
	delta = delta
	if cacher_bouteille == true:
		cacher.emit()
	
	if get_node("mouvement").get_node("affichage_mouvement").visible == true and affichage_mouvement == false:
		get_node("mouvement").get_node("affichage_mouvement").visible = false
	else:
		affichage_mouvement = false
	
	if get_node("didactiel_saut").get_node("affichage_saut").visible == true and afficher_saut == false:
		get_node("didactiel_saut").get_node("affichage_saut").visible = false
	else:
		afficher_saut = false

	if get_node("didactiel_attaque").get_node("affichage_attaque").visible == true and afficher_attaque == false:
		get_node("didactiel_attaque").get_node("affichage_attaque").visible = false
	else:
		afficher_attaque = false
		
	if get_node("didactiel_glissade").get_node("affichage_glissade").visible == true and afficher_glissade == false:
		get_node("didactiel_glissade").get_node("affichage_glissade").visible = false
	else:
		afficher_glissade = false
func _on_glissade_area_2d_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_2_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_3_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_4_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_5_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_6_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_7_lever():
	envoyer_lever.emit()


func _on_glissade_area_2d_8_lever():
	envoyer_lever.emit()


func _on_area_mouvement_cacher_affichage_mouvement():
	get_node("mouvement").get_node("affichage_mouvement").visible = true
	affichage_mouvement = true

func _on_area_mouvement_cacher_affichage_saut():
	get_node("didactiel_saut").get_node("affichage_saut").visible = true
	afficher_saut = true

func _on_area_mouvement_cacher_affichage_attaque():
	get_node("didactiel_attaque").get_node("affichage_attaque").visible = true
	afficher_attaque = true

func _on_area_mouvement_cacher_affichage_glissade():
	get_node("didactiel_glissade").get_node("affichage_glissade").visible = true
	afficher_glissade = true
