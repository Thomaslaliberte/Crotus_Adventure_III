class_name MachineEtat
extends Node

@export var etat_actuel: Etat
var etats: Dictionary = {}

func _ready():
	for enfant in get_children():
		if enfant is Etat:
			# Ajoute l'état au dictionnaire en utilisant son nom
			etats[enfant.name] = enfant
 
			# Connecte la machine à états au signal de changement d'état
			enfant.etat_change.connect(on_enfant_change)
			
	# Exécute l'état initial
	etat_actuel.Initialisation()

func _process(delta):
	etat_actuel.Process(delta)
		
func _physics_process(delta):
	etat_actuel.Physics_Process(delta)

func on_enfant_change(nouvel_etat: StringName) -> void:
	# Trouve le nouvel état dans le dictionnaire
	var etat_suivant = etats.get(nouvel_etat)
 
	if etat_suivant != null:
		if etat_suivant != etat_actuel:
			# Libérer l'état actuel
			etat_actuel.Liberation()
 
			# Initialiser le nouvel etat
			etat_suivant.Initialisation()
 
			# Mettre à jour la variable d'état courant
			etat_actuel = etat_suivant
