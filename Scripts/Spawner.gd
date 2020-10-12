extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var scene_to_instance
export (float) var Timer_Time

export (bool) var active=false
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active and $Timer.is_stopped():
		$Timer.start(Timer_Time)
		var scene=scene_to_instance.instance()
		scene.global_position=Vector2(0+rand_range(0,1280),global_position.y)
		get_tree().get_root().add_child(scene)
		
	pass
