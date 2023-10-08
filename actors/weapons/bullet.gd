extends RigidBody2D

@export var damage := 50.0

@onready var player := $AudioStreamPlayer2D

func _on_body_entered(body:Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		player.play()
	queue_free()
