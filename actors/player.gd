extends CharacterBody2D

@export var speed = 300.0

@export var health_max := 100.0

@onready var health := health_max

@onready var hurt_timer: Timer = $HurtTimer #TODO move timer to enemy object
@onready var health_meter: ProgressBar = $HealthMeter


signal died

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	health_meter.max_value = health_max
	health_meter.value = health


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = direction.normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity * 0.25

	move_and_slide()

func take_damage(damage: float) -> void:
	if hurt_timer.time_left == 0:
		health -= damage
		health_meter.value = int((health / health_max) * 100)

		if health <= 0:
			emit_signal("died")

		hurt_timer.start()
