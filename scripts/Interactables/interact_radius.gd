extends Area3D

var interactables : Array[Interactable]

func _on_area_entered(area):
	if area is Interactable:
		interactables.append(area)

func _on_area_exited(area):
	if area is Interactable:
		interactables.erase(area)

func _process(_delta):
	$Text.visible = false
	if interactables.size() > 0:
		var closestInteractable := interactables[0]
		var closetsDist := closestInteractable.global_position.distance_to(global_position)
		
		for i in interactables.size() - 1:
			var dist = interactables[i + 1].global_position.distance_to(global_position)
			if dist < closetsDist:
				closetsDist = dist
				closestInteractable = interactables[i+1]
		
		$Text.visible = true
		$Text.global_position = closestInteractable.global_position
		$Text.text = closestInteractable.interactText
		
		if Input.is_action_just_pressed(closestInteractable.inputAction):
			closestInteractable.interact()
