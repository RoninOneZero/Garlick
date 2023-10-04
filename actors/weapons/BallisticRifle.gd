extends Node2D

@export var _bullet: PackedScene #= preload("uid://c5ev2p5pl8siw")
@export var bullet_speed := 500.0
@export var bullet_cooldown := 1.0

@onready var target_area: Area2D = $TargetArea
@onready var weapon_cooldown: Timer = $WeaponCooldown

func _ready() -> void:
	weapon_cooldown.wait_time = bullet_cooldown

func _physics_process(_delta: float) -> void:

	# Check for targets in range
	var targets: Array = target_area.get_overlapping_bodies()
	# Assign a target as closest. May return null
	var closest_target: Node2D = targets.pop_front()

	if !targets.is_empty():
		#Get closest target
		for target in targets:
			if global_position.distance_to(target.global_position) < global_position.distance_to(closest_target.global_position):
				closest_target = target

	# Fire at valid target
	if closest_target:
		_fire_weapon(closest_target)

# Fire weapon at a given target
func _fire_weapon(target: Node2D) -> void:
	if weapon_cooldown.time_left == 0:
		var bullet: RigidBody2D = _bullet.instantiate()

		bullet.linear_velocity = global_position.direction_to(target.global_position) * bullet_speed
		bullet.global_position = global_position

		get_tree().root.add_child(bullet)

		weapon_cooldown.start(bullet_cooldown)


