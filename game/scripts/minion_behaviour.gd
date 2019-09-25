extends RigidBody2D

export(String, "dark_minion" , "light_minion") var minion_type = ""

func _ready():
	pass 


func _on_minion_light_body_entered(body):
	print(body)
	if body.has_function("get_minion"):
		body.get_minion(self , minion_type)
		print("Entrei no body")




func _on_minion_light_body_shape_entered(body_id, body, body_shape, local_shape):
	print(body)
	if body.has_function("get_minion"):
		body.get_minion(self , minion_type)
		print("Entrei no body")


func _on_Area2D_body_entered(body):
	if body.has_method("get_minion"):
		body.get_minion(self , minion_type)
		print("Entrei no body")
