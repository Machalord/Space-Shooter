extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed = 400
var velocity = Vector2()

func _ready():
	randomize()
	start(global_position)

func start(pos):
	position = pos
	rotation=rand_range(0,360)
	velocity = Vector2(0, speed)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
