extends Area2D

var graphicloader = preload("res://Effects/Hiteffect.tscn")
export(bool) var showHit = true 

func _on_Hurtboxes_area_entered(_area):
	if showHit:
		var graphicplayer = graphicloader.instance()
		var tree = get_tree().current_scene
		tree.add_child(graphicplayer)
		graphicplayer.global_position = global_position - Vector2(0,8)
