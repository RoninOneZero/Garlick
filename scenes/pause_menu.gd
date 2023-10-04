extends Control

signal unpaused


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_game_button_down() -> void:
	get_tree().quit()


func _on_resume_game_button_down() -> void:
	hide()
	emit_signal("unpaused")
