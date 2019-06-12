extends Node


func _ready():
	pass 


func _on_btn_play_pressed():
	get_tree().change_scene("res://Scenes/game.tscn")


func _on_btn_play2_pressed():
	get_tree().change_scene("res://Scenes/tela_inicial.tscn")
