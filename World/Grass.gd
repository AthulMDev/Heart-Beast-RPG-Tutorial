extends Node2D

func graphic_expresser():
	var graphicloader = load("res://Effects/grasseffect.tscn")
	var graphicinstancer = graphicloader.instance()
	var currentlevel = get_tree().current_scene
	currentlevel.add_child(graphicinstancer)
	graphicinstancer.global_position = global_position

func _on_Hurtboxes_area_entered(_area):
	graphic_expresser()
	queue_free()
