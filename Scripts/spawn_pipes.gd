extends Node2D

onready var pre_pipes = preload("res://Scenes/pipe.tscn")
const POS_X = 360

func _ready():
	randomize() 


func _on_timer_timeout():
	create_pipes()

func create_pipes():
	var pipes = pre_pipes.instance()
	pipes.global_position = Vector2(POS_X, rand_range(230, 340))
	get_parent().add_child(pipes)
	