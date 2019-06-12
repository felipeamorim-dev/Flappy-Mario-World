extends Node

const GROUP_PLAYER = "player"
var score = 0 setget setScore
enum game_state {PLAYING, STOPED}
var state = game_state.PLAYING

signal changeScore

func _ready():
	state = game_state.PLAYING


func setScore(valor):
	score = valor
	emit_signal("changeScore")


func game_over():
	state = game_state.STOPED
	$musica_fx.stop()
	$spawn_pipes/timer.stop()
	$player.die()


