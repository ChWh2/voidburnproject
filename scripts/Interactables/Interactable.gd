extends Area3D
class_name Interactable

@export var interactText = "E to interact"
@export var inputAction = "E"

signal Interacted

func interact():
	Interacted.emit()
