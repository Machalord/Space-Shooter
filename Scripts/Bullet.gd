extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export (int) var speed = 20
export (int) var acceleration_speed = 3
var velocity = Vector2()
var acceleration = Vector2()

func _ready():
	pass

func start(pos):
	position = pos
	velocity = Vector2(0, -speed)
	acceleration=Vector2(0,-acceleration_speed)
	
func start2(pos,target):
	position = pos
	look_at(target.global_position)
	velocity = Vector2(speed,0).rotated(rotation)
	acceleration=Vector2(acceleration_speed,0).rotated(rotation)
	$Sprite.rotation_degrees=90

func _physics_process(delta):
	velocity+=acceleration*delta
	var collision = move_and_collide(velocity)


func _on_Bullet_area_entered(area):
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("Destructible"):
		area.get_parent().queue_free()
		queue_free()
	pass # Replace with function body.
