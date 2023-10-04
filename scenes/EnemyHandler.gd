extends Node

@export var spawn_radius: float = 1400.0

@export var player: CharacterBody2D

@export var packed_enemy: PackedScene

@onready var elapsed_time := 0.0

signal time_update


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Send clock information
	elapsed_time += delta

	emit_signal("time_update", elapsed_time)
