extends Node

signal new_game

func _ready():
	$music_fx.play() 
	atualiza_pontuacao()


func atualiza_pontuacao():
	
	if game.score > save_data.best_score:
		save_data.best_score = game.score
		save_data.save_score()
	$canvas/vbox/last_score.text = "Last: " + str(game.score)
	$canvas/vbox/best_score.text = "Best: " + str(save_data.best_score)

func _on_btn_play_pressed():
	emit_signal("new_game")
	


func _on_btn_play2_pressed():
	fadeIn()
	yield($fade_in/anim, "animation_finished")
	get_tree().change_scene("res://Scenes/tela_inicial.tscn")


func _on_game_over_new_game():
	game.score = 0
	fadeIn()
	yield($fade_in/anim, "animation_finished")
	get_tree().change_scene("res://Scenes/game.tscn")


func fadeIn():
	$fade_in.show()
	$fade_in/anim.play("fade_in")





