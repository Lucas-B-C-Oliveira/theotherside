extends Node2D

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var character : StaticBody2D = $minion_light
onready var player : KinematicBody2D = $player

var spectral = false;

func _ready():
	$Special.visible = false

func _unhandled_input(event: InputEvent) -> void:
	
	if not event is InputEventMouseButton:
		return
	
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	

func _process(delta):
	if $player.blue_box:
		$Special.visible = true

func _on_Timer_timeout():
	
	var new_path : = nav_2d.get_simple_path(character.global_position , player.global_position)
#	line_2d.points = new_path
	character.path = new_path

func stop_timer():
	$Timer.stop()

func start_timer():
	$Timer.start()

func restartGame():
	get_tree().reload_current_scene()

func _on_Area2D2_body_entered(body):
	if body.has_method("playerDie"):
		$Slime_Lerp2.go_to_player(body)


func _on_Area22D2_body_entered(body):
	if body.has_method("playerDie"):
		$Slime_Lerp.go_to_player(body)


func _on_AreaEspecial_body_entered(body):
	if body.has_method("playerDie") and body.blue_box:
		get_tree().change_scene("res://game/scenes/YouWin_Menu.tscn")
