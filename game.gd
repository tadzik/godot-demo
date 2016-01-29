extends Node2D

var p1start
var p2start
var p1pts = 0
var p2pts = 0
var gibs

func _ready():
	p1start = get_node("PlayerOne").get_pos()
	p2start = get_node("PlayerTwo").get_pos()
	gibs = preload("res://giblets.scn")

func on_frag(winner):
	print("5 points for player " + str(winner) + "!")
	if winner == "p1":
		p1pts += 5
		get_node("PointsOne").set_text(str(p1pts))
	else:
		p2pts += 5
		get_node("PointsTwo").set_text(str(p2pts))
	var g = gibs.instance()
	add_child(g)
	g.set_emitting(true)
	g.set_pos(get_node("PlayerOne").get_pos())
	get_node("PlayerOne").set_pos(p1start)
	get_node("PlayerTwo").set_pos(p2start)
	