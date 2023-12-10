extends Node2D

@export var audio_track: AudioStreamWAV

@onready var pause_menu: Control = $Player/Camera2D/PauseMenu
@onready var game_over: Control = $HUD/GameOver


func _ready() -> void:
	#AudioHandler.play(audio_track)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		pause_menu.show()


func _on_pause_menu_unpaused() -> void:
	get_tree().paused = false


func _on_player_died() -> void:
	game_over.show()
	get_tree().paused = true


func _on_enemy_handler_victory() -> void:
	print("You Win!")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
