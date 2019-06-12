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
	
	if score > save_data.best_score:
		save_data.best_score = score
		print(save_data.best_score)
	
	$musica_fx.stop()
	$spawn_pipes/timer.stop()
	$player.die()


func _on_musica_fx_finished():
	$musica_fx.play()
