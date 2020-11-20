extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed=500
var velocity=Vector2()
var bullet_scene=preload("res://Scenes/Bullet.tscn")
var target
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target=get_global_mouse_position()
	if !Input.is_action_pressed("lock"):
		look_at(target)
	velocity=Vector2()
	
	if Input.is_action_pressed("shoot"):
		if Input.is_action_pressed("lock"):
			Shoot_Locked()	
		else:	
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
	#velocity=position.direction_to(target.position)*speed
	
func _physics_process(delta):
	velocity = move_and_slide(velocity)		
	var pos = Vector2()    
	pos.x = clamp(position.x, $Sprite.get_rect().size.x/2, get_viewport_rect().size.x-$Sprite.get_rect().size.x/2)
	pos.y = clamp(position.y, $Sprite.get_rect().size.y/2, get_viewport_rect().size.y-$Sprite.get_rect().size.y/2)
	global_position = pos
	
#	pass
func Shoot():
	if $ShootColdown.is_stopped():
		var bullet = bullet_scene.instance()
		bullet.start3($ShotPos1.global_position,target)
		bullet.z_index=z_index-1
		get_tree().get_root().add_child(bullet)
		$ShootColdown.start()
	pass
func Shoot_Locked():
	if $ShootColdown.is_stopped():
		var bullet = bullet_scene.instance()
		bullet.start3($ShotPos1.global_position,global_position-$ShotPos1.global_position)
		bullet.z_index=z_index-1
		get_tree().get_root().add_child(bullet)
		$ShootColdown.start()
	pass	


func _on_Area2D_area_entered(area):
	print(area.name)
	pass # Replace with function body.
