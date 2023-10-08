extends Control

@export var game_scene: PackedScene
@export var title_theme: AudioStreamWAV


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioHandler.play(title_theme)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_game_button_down() -> void:
	get_tree().quit()


func _on_start_game_button_down() -> void:
	get_tree().change_scene_to_packed(game_scene)
