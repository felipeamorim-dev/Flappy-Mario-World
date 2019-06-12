extends Node

var last_score = 0
var best_score = 0

func _ready():
	$music_fx.play() 
	change_last_score(game.score)
	change_best_score(save_data.best_score)

func change_last_score(valor):
	last_score = valor
	$canvas/vbox/last_score.text = "Last: " + str(game.score)

func change_best_score(new_valor):
	best_score = new_valor
	$canvas/vbox/best_score.text = "Best: " + str(best_score)

func _on_btn_play_pressed():
	get_tree().change_scene("res://Scenes/game.tscn")


func _on_btn_play2_pressed():
	get_tree().change_scene("res://Scenes/tela_inicial.tscn")
