extends RigidBody2D

const JUMP = 350
const IMPULSE = 200
var is_alive = true

signal hit
signal trasition

func _ready():
	add_to_group(game.GROUP_PLAYER)
	$anim.play("run")
	linear_velocity = Vector2(0, 0) 

func _physics_process(delta):
	
	if is_alive:
		if linear_velocity.y == 0:
			$anim.play("run")
		elif linear_velocity.y < 0:
			$anim.play("floating")
		elif linear_velocity.y > 0:
			$anim.play("falling")
	else:
		_hit()

func flap():
	linear_velocity = Vector2(0, -1) * JUMP
	$flap_fx.play()

func die():
	if is_alive:
		is_alive = false
		$anim.play("die")
		$die_fx.play()
		linear_velocity = Vector2(0, -1) * IMPULSE


func _input(event):
	if is_alive:
		if event.is_action_pressed("ui_touch"):
			flap()

func _hit():
	emit_signal("hit")

func _on_die_fx_finished():
	emit_signal("trasition")
