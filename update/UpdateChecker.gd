extends Control

@onready var status_label = $Label

func _ready():
	_check_for_updates()

func _check_for_updates() -> void:
	await get_tree().create_timer(1.25).timeout
	status_label.text = "檢查登入信息..."
	_check_login_info()

func _check_login_info() -> void:
	var saved_username = ProjectSettings.get_setting("user/username", "")
	var saved_password = ProjectSettings.get_setting("user/password", "")

	if saved_username != "" and saved_password != "":
		_attempt_login(saved_username, saved_password)
	else:
		await get_tree().create_timer(1.25).timeout
		get_tree().change_scene_to_file("res://login/LoginScreen.tscn")

func _attempt_login(username: String, password: String) -> void:
	await get_tree().create_timer(1.25).timeout
	status_label.text = "點擊任意位置進入遊戲"
	connect("gui_input", Callable(self, "_on_gui_input"))

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://main/Main.tscn")
