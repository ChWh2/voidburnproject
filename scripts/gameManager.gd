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
	
	currentLevel.nextLevel.connect(nextlevel)

func nextlevel(inVoid : bool, exitPos : Vector3):
	currentLevelIndex += 1
	currentLevel.queue_free()
	
	if currentLevelIndex < levels.size():
		currentLevel = levels[currentLevelIndex].instantiate()
		add_child(currentLevel)
		currentLevel.plr = plr
	
		plr.global_position = plr.global_position - exitPos + currentLevel.spawn
	
		if inVoid:
			currentLevel.enterVoid()
		else:
			currentLevel.enterMain()
		
		currentLevel.nextLevel.connect(nextlevel)
	else:
		get_tree().change_scene_to_file("res://Scenes/levels/end.tscn")
		
""" 
func _process(_delta):
	if Input.is_action_just_pressed('TAB'):
		currentLevel.toggleWorld()
	if Input.is_action_just_pressed("SLASH"):
		nextlevel(!plr.alive, Vector3(0,0,0))
"""

func _on_player_died():
	currentLevel.enterVoid()


func _on_player_revive():
	currentLevel.enterMain()
