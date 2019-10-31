extends KinematicBody2D

var direction = -1
var speed = 15000


func _process(delta):
	##global_position.y += direction  * speed * delta
	pass

func _physics_process(delta):
	move_and_slide(Vector2(0, direction) * speed * delta)
	

func _on_Timer_ready():
	direction *= -1
	


func _on_Timer_timeout():
	direction *= -1


func _on_Area2D_body_entered(body):
	print(body)
	if body.has_method("playerDie"):
		body.playerDie()
