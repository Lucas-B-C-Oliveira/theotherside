extends KinematicBody2D

#export(String, "dark_minion" , "light_minion") var minion_type = ""
var player

func _ready():
	pass 


#func _on_Area2D_body_entered(body):
#	if body.has_method("get_minion"):
#		body.get_minion(self , minion_type)
#		print("Entrei no body AREA")
#		## Chama....


func _on_Area2D_body_entered(body):
	
	if body.has_method("set_damage"):
		player = body
		$timerAttack.start(1.5)
	else:
		player = null

func _on_Area2D_body_exited(body):
	
	if body.has_method("set_damage"):
		player = null
		$timerAttack.stop()

func _on_timerAttack_timeout():
	attack_Player(self.player)

func attack_Player(player):
	var damage = fuzzy_Random_Number()
	player.set_damage(damage)

func fuzzy_Random_Number():
	var chance = randi()%101+1
	var damaged
	
	if chance > 93:
		damaged = 50
	elif chance > 83 and chance <= 93:
		damaged = 20
	elif chance <= 83 and chance > 50:
		damaged = 7
	elif chance <= 50:
		damaged = 3
	
	return damaged






