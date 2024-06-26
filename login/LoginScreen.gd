extends Control

func _ready():
	$LoginButton.connect("pressed", Callable(self, "_on_LoginButton_pressed"))

func _on_LoginButton_pressed():
	var username = $Username.text
	var password = $Password.text
	_attempt_login(username, password)

func _attempt_login(username: String, password: String):
	ProjectSettings.set_setting("user/username", username)
	ProjectSettings.set_setting("user/password", password)
	ProjectSettings.save()
	get_tree().change_scene_to_file("res://main/Main.tscn")
