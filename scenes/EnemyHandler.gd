extends Node

@export var player: CharacterBody2D
@export var enemy_waves: Array = []

@onready var spawn_radius :float = get_viewport().size.x / 2

var elapsed_time := 0.0

signal time_update


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize first waves
	for wave in enemy_waves:
		var timer = Timer.new()
		timer.timeout.connect(_on_wave_timer_timeout)
		timer.one_shot = true
		add_child(timer)
		timer.start(wave.time_code)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Send clock information, snapped to milliseconds
	elapsed_time += delta	
	emit_signal("time_update", snapped(elapsed_time, 0.1))


func spawn_enemy(enemy: PackedScene, location: Vector2) ->void:
	var enemy_node: Node2D = enemy.instantiate()
	enemy_node.target = player
	enemy_node.global_position = location
	get_parent().add_child(enemy_node)

# Spawn a pack of enemies around a location
func spawn_enemy_group(enemy: PackedScene, origin: Vector2, amount: int) ->void:
	for n in amount:
		var spawn_location := random_point_on_circle(origin, spawn_radius)
		spawn_enemy(enemy, spawn_location)

func random_point_on_circle(origin: Vector2, radius: float) -> Vector2:
	var circle_radius := Vector2.ONE * radius
	var random_point: Vector2 = circle_radius.rotated(randf_range(0, 2 * PI))
	return origin + random_point

var current_wave: int = 0
func _on_wave_timer_timeout() -> void:
	var wave: EnemyWave = enemy_waves[current_wave]
	spawn_enemy_group(wave.enemy, player.global_position, wave.amount)
	current_wave += 1


