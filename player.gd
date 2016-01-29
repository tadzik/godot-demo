extends KinematicBody2D

export(String) var key_prefix
export var movespeed = 10.0
export var rps = 15.0
var rot = 0.0

func _ready():
	set_fixed_process(true)

func _fixed_process(dt):
	rot += rps * dt
	set_rot(rot)
	var dx = 0.0
	var dy = 0.0
	if Input.is_action_pressed(key_prefix + "_up"):
		dy -= movespeed
	if Input.is_action_pressed(key_prefix + "_down"):
		dy += movespeed
	if Input.is_action_pressed(key_prefix + "_left"):
		dx -= movespeed
	if Input.is_action_pressed(key_prefix + "_right"):
		dx += movespeed
	move(Vector2(dx, dy))

func get_hit_by_axe(hitter):
	print("SHIIIIIT")


func _on_axe_hitting_body(body):
	if (body == self):
		return
	print("Axe hit body!")
	if body.has_method("get_hit_by_axe"):
		body.get_hit_by_axe(self)
		get_parent().on_frag(key_prefix)
	else:
		rps *= -1


func _on_axe_hitting_area(area):
	#print("Axe hit area!")
	rps *= -1