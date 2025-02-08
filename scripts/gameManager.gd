extends Node3D

@export var levels : Array[PackedScene]

var currentLevel : level
var currentLevelIndex := 0

@export var plr : player

func _ready():
	currentLevel = levels[0].instantiate()
	add_child(currentLevel)
	currentLevel.plr = plr
	plr.position = currentLevel.spawn

func nextlevel():
	currentLevelIndex += 1
	currentLevel.queue_free()
	
	currentLevel = levels[currentLevelIndex].instantiate()
	add_child(currentLevel)
	currentLevel.plr = plr
	
	plr.position = currentLevel.spawn

func _process(_delta):
	if Input.is_action_just_pressed('TAB'):
		currentLevel.toggleWorld()

func _on_player_died():
	currentLevel.enterVoid()
