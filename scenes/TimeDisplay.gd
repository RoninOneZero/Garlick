extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_handler_time_update(time_seconds: float) -> void:
	var minutes := time_seconds / 60
	var seconds := fmod(time_seconds, 60)

	text = "%02d:%04.1f" % [minutes, seconds]
	
