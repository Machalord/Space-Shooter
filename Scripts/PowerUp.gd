extends KinematicBody2D


export (int) var speed = 400
var velocity = Vector2()

func _ready():
	start(global_position,45)

func start(pos, dir):
	position = pos
	velocity = Vector2(speed, 0).rotated(dir)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
