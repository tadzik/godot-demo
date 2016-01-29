
extends Particles2D

# member variables here, example:
# var a=2
# var b="textvar"
var lifetime = 0

func _ready():
	set_process(false)

func _process(dt):
	lifetime += dt
	if lifetime > 1:
		set_emitting(false)
