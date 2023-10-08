extends Node

@onready var player := $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func play(track: AudioStream) -> void:
	player.stream = track
	player.play()
