extends Node

export var max_health = 1
onready var health = max_health setget sethealth
signal death

func sethealth(value):
	health = value
	if health <= 0:
		emit_signal("death")
