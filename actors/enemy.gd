extends RigidBody2D

const SPEED = 255.0

@export var target: Node2D

@export var health_max := 100.0
@onready var _health := health_max

@export var damage := 25.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	if target:
		var direction := global_position.direction_to(target.position).normalized()
		if direction:
			linear_velocity = direction * SPEED
		else:
			linear_velocity *= 0.25
	

func take_damage(amount: float) -> void:
	_health -= amount
	if _health <= 0:
		die()


func die() -> void:
	queue_free()

func _on_body_entered(body:Node) -> void:
	if body.is_in_group("Player"):
		body.take_damage(damage)
