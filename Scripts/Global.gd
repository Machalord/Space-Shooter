extends Node2D

var score=0
var lifes=3
var level=0
var game_state

signal UpdateHud
func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		lifes-=1
		emit_signal("UpdateHud")
