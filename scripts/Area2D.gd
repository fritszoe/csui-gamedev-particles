extends Area2D

@export var scene: PackedScene

func _on_Area_Trigger_body_entered(body):
	if body.name == "Player" and scene:
		get_tree().change_scene_to_packed(scene)
