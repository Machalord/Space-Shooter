extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_scene=preload("res://Scenes/Bullet.tscn")
var target
var velocity = Vector2()

var speed=200	


# Called when the node enters the scene tree for the first time.
func _ready():
	target=get_tree().get_nodes_in_group("Player")[0]
	pass # Replace with function body.
func Shoot():
	if $ShootColdown.is_stopped():
		var bullet = bullet_scene.instance()
		bullet.start2($ShotPos1.global_position,target)
		bullet.z_index=z_index-1
		get_tree().get_root().add_child(bullet)
		$ShootColdown.start()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity=position.direction_to(target.position)*speed
	look_at(target.position) 
	if position.distance_to(target.position) > 5:
		velocity = move_and_slide(velocity)
	if position.distance_to(target.position) > 500:	
		Shoot()
	pass
