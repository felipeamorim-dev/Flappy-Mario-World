extends Node2D

var game_current
const SPEED = 250
const DIR = Vector2(-1, 0)

func _ready():
	game_current = get_tree().current_scene
	set_process(true)

func _process(delta):
	if game_current.state == game_current.game_state.PLAYING:
		translate(DIR * SPEED * delta)



func _on_ponto_body_entered(body):
	if game_current.state == game_current.game_state.PLAYING:
		if body.is_in_group(game.GROUP_PLAYER):
			game.score += 1
			$coin_fx.play()


func _on_body_body_entered(body):
	if game_current.state == game_current.game_state.PLAYING:
		if body.is_in_group(game.GROUP_PLAYER):
			if body.has_method("_hit"):
				body._hit()

func _on_visibility_screen_exited():
	queue_free()
