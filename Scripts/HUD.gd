extends Control

func _ready():
	Global.connect("UpdateHud",self,"UpdateHud")
	pass
	
func UpdateHud():
	$HBoxContainer/LifeLabel.text=str(Global.lifes)
	pass	
