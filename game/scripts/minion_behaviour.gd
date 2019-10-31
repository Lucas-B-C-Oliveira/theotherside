extends KinematicBody2D

#export(String, "dark_minion" , "light_minion") var minion_type = ""
var player
var speed : = 100.0
var path : = PoolVector2Array() setget set_path

func _ready() -> void:
	
	set_process(false)



func _process(delta: float) -> void:
	
	var move_distance : = speed * delta
	move_along_path(move_distance)


func _on_Area2D_body_entered(body):
	print(body)
	if body.has_method("set_damage"):
		player = body
		$timerAttack.start(.5)
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
	
	print(chance)
	
	if chance > 93:
		damaged = 50
	elif chance > 83 and chance <= 93:
		damaged = 20
	elif chance <= 83 and chance > 50:
		damaged = 7
	elif chance <= 50:
		damaged = 3
	print("Damage")
	print(damaged)
	return damaged
	

func move_along_path(distance : float) -> void:
	
	var start_point : = position
	
	for i in range(path.size()):
		
		var distance_to_next : = start_point.distance_to(path[0])
		
		if distance <= distance_to_next and distance >= 0.0:
			
			position = start_point.linear_interpolate(path[0] , distance / distance_to_next)
			break
		
		elif distance < 0.0:
			
			position = path[0]
			set_process(false)
			break
		
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
	

func set_path(value : PoolVector2Array) -> void:
	
	path = value
	
	if value.size() == 0:
		return
	
	set_process(true)






