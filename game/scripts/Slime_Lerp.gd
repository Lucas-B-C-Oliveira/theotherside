extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Area2D_body_entered(body):
	
	if body.has_method("playerDie"):
		body.playerDie()

func go_to_player(player):
	global_position = lerp(global_position, player.global_position,.8)


func _on_Timer_timeout():
	pass # Replace with function body.
