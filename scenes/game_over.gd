extends Control

#@export var main_menu: PackedScene


func _on_main_menu_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_game_button_down() -> void:
	get_tree().quit()

