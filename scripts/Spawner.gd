extends Node2D

@onready var enemy = preload("res://Scenes/Enemy.tscn")

@export var spawn_rate: float = 0.3
@export var active_duration: float = 5.0
@export var pause_duration: float = 2.0

var current_time = 0
var state_timer = 0.0
var is_spawning = true

func _ready():
	current_time = spawn_rate
	state_timer = active_duration
		
func _process(delta):
	state_timer -= delta
	if is_spawning:
		current_time -= delta
		if current_time <= 0:
			current_time = spawn_rate
			var new_enemy = enemy.instantiate()
			add_child(new_enemy)

		# Transition to pause state
		if state_timer <= 0:
			is_spawning = false
			state_timer = pause_duration
	else:
		# Pause state
		if state_timer <= 0:
			is_spawning = true
			state_timer = active_duration
			current_time = spawn_rate
