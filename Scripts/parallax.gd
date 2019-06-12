extends ParallaxBackground

export var speed = 0
var offset_x = 0
var game_current

func _ready():
	game_current = get_tree().current_scene

func _process(delta):
	if game_current.state == game_current.game_state.PLAYING:
		offset_x -= speed * delta
		scroll_offset = Vector2(offset_x, 0)