extends Node3D
class_name elevator

signal goDown(inVoid : bool, exitPos : Vector3)
@export var isInVoid : bool = false

func _on_area_3d_body_entered(body):
	if body is player:
		print("player")
		$Area3D.queue_free()
		$AnimationPlayer.play("close")
		$Timer.start()

func _on_timer_timeout():
	print("timer")
	goDown.emit(isInVoid, global_position)
