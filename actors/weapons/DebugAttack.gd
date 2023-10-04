extends Area2D

@export var attack_cooldown: float = 1.0

func _on_body_entered(body:Node2D) -> void:
	body.queue_free()
