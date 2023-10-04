extends Node2D

@onready var pause_menu: Control = $Player/Camera2D/PauseMenu
@onready var game_over: Control = $HUD/GameOver

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		pause_menu.show()


func _on_pause_menu_unpaused() -> void:
	get_tree().paused = false


func _on_player_died() -> void:
	game_over.show()
	get_tree().paused = true
