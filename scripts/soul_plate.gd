extends Area3D

var plr : player

@export var burning := false
var playerinfire := false

func _on_body_entered(body):
	if body is player:
		plr = body
		playerinfire = true

func _on_body_exited(body):
	if body is player:
		playerinfire = false

func _process(_delta):
	if burning:
		$Fire.emitting = true
		if playerinfire:
			plr.getRevive()
			playerinfire = false
	else:
		$Fire.emitting = false

func toggleBurn():
	burning = !burning
