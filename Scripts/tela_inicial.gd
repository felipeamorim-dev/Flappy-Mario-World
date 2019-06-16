extends Node


func _ready():
	atualiza_variaveis()

func atualiza_variaveis():
	game.score = 0

func _on_btn_play_pressed():
	$canvas/btn_play.icon = load("res://Sprites/Button_play.png")
	get_tree().change_scene("res://Scenes/game.tscn")


