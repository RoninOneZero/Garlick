extends Node

#@export var spawn_radius: float = 1400.0
@export var player: CharacterBody2D
@export var packed_enemy: PackedScene

@onready var spawn_radius :float = get_viewport().size.x / 2

var elapsed_time := 0.0

signal time_update


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_F3:
			var spawn_location := random_point_on_circle(player.global_position, spawn_radius)
			spawn_enemy(packed_enemy, spawn_location)


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


func random_point_on_circle(origin: Vector2, radius: float) -> Vector2:
	var circle_radius := Vector2.ONE * radius
	var random_point: Vector2 = circle_radius.rotated(randf_range(0, 2 * PI))
	return origin + random_point
