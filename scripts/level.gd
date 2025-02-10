extends Node3D
class_name level

@export var spawn := Vector3.ZERO

@onready var main = $main
@onready var afterlife = $void

var plr : player

@export var normalEnvironment : Environment
@export var voidEnvironment : Environment

signal nextLevel(inVoid : bool, exitPos : Vector3)

func _ready():
	afterlife.position.y += 1000.0
	
	enterMain()

func enterVoid():
	$WorldEnvironment.environment = voidEnvironment
	
	afterlife.visible = true
	main.visible = false
	
	if is_instance_valid(plr) && plr.alive:
		plr.alive = false
		plr.position.y += 1000.0

func enterMain():
	afterlife.visible = false
	main.visible = true
	$WorldEnvironment.environment = normalEnvironment
	
	if is_instance_valid(plr) && !plr.alive:
		plr.alive = true
		plr.position.y -= 1000.0

func toggleWorld():
	if afterlife.visible:
		enterMain()
	else:
		enterVoid()

func exit(inVoid : bool, exitPos : Vector3):
	nextLevel.emit(inVoid, exitPos)
	print("emitLevel")
