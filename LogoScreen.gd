extends Control

func _ready():
	$Timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene_to_file("res://update/UpdateChecker.tscn")
