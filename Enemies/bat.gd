extends KinematicBody2D

var knockback = Vector2.ZERO

func _physics_process(_delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * _delta)
	knockback = move_and_slide(knockback)

func _on_Hurtboxes_area_entered(_area):
	knockback = Vector2.RIGHT * 125
