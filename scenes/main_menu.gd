extends Control

@export var game_scene: PackedScene
#@export var title_theme: AudioStreamWAV

@onready var audio_player := $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_player.volume_db = -80
	audio_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	audio_player.volume_db = lerpf(audio_player.volume_db, 0, delta)


func _on_quit_game_button_down() -> void:
	get_tree().quit()


func _on_start_game_button_down() -> void:
	get_tree().change_scene_to_packed(game_scene)

