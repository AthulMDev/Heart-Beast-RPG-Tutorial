extends Node2D

onready var animator = $AnimatedSprite

func _ready():
	animator.frame = 0
	animator.play("animate")


func _on_AnimatedSprite_animation_finished():
	queue_free()
