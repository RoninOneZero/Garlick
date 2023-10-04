extends RigidBody2D

@export var damage := 50.0

func _on_body_entered(body:Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)

	queue_free()