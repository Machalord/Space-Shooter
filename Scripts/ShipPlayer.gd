extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed=500
var velocity=Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity=Vector2()
	
	if Input.is_action_pressed("shoot"):
		Shoot()
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):		
		velocity.y += 1		
		
		
	velocity = velocity.normalized()*speed
	
func _physics_process(delta):
	velocity = move_and_slide(velocity)		
	
#	pass
func Shoot():
	
	pass


func _on_Area2D_area_entered(area):
	print(area.name)
	pass # Replace with function body.
