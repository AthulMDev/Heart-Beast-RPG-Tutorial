extends KinematicBody2D

var knockback = Vector2.ZERO
onready var stats = $stats
const graphicloader = preload("res://Effects/EnemyDeathEffect.tscn")

func _physics_process(_delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * _delta)
	knockback = move_and_slide(knockback)

func _on_Hurtboxes_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 120


func _on_stats_death():
	queue_free()
	var graphicPlayer = graphicloader.instance()
	get_parent().add_child(graphicPlayer)
	graphicPlayer.global_position = global_position
