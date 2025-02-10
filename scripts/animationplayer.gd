extends Node

@export var animationPlayer : AnimationPlayer
@export var animationName : String

func play():
	animationPlayer.play(animationName)
