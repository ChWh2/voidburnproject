extends Node3D

@export var oneShot := false
signal pushed

func _on_interact_point_interacted():
	pushed.emit()
	$AnimationPlayer.play("push")
	if oneShot:
		$InteractPoint.queue_free()
