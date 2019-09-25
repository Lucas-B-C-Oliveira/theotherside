extends KinematicBody2D

# Var's Move
var direction_x = 0
var direction_y = 0
var speed = 10000

# Var's Anim of Player
var anim_x = 0
var anim_y = 0

var i_took_minion = false
var current_minion

func _ready():
	pass 

func _input(event):
	move_input_manager()


func _physics_process(delta):
	move(delta)
	took_minion()

func _process(delta):
	anim_movement_of_player()

### Manager Inputs
func move_input_manager():
	
	if Input.is_action_pressed("ui_right"):
		direction_x = 1
		anim_x = 1
		anim_y = 0
	elif Input.is_action_just_released("ui_right"):
		direction_x = 0 
		anim_x = 2
		anim_y = 0
		
	if Input.is_action_pressed("ui_left"):
		direction_x = -1
		anim_x = -1
		anim_y = 0
	elif Input.is_action_just_released("ui_left"):
		direction_x = 0 
		anim_x = -2
		anim_y = 0
	
	if Input.is_action_pressed("ui_up"):
		direction_y = -1
		anim_y = 1
		anim_x = 0
	elif Input.is_action_just_released("ui_up"):
		direction_y = 0
		anim_y = 2
		anim_x = 0
	
	if Input.is_action_pressed("ui_down"): 
		direction_y = 1
		anim_y = -1
		anim_x = 0
	elif Input.is_action_just_released("ui_down"):
		direction_y = 0 
		anim_y = -2
		anim_x = 0

### Functions of Movement
func move(delta):
	move_and_slide(Vector2(direction_x , direction_y) * speed * delta)

func anim_movement_of_player():
	
	if anim_x == 1:
		$anim.play("run_right")
	if anim_x == -1:
		$anim.play("run_left")
	if anim_x == 2:
		$anim.play("idle_right")
	if anim_x == -2:
		$anim.play("idle_left")
	
	if anim_y == 1:
		$anim.play("run_up")	
	if anim_y == -1:
		$anim.play("run_down")
	if anim_y == 2:
		$anim.play("idle_up")
	if anim_y == -2:
		$anim.play("idle_down")

func get_minion(minion , minion_type):
	i_took_minion = true
	current_minion = minion
	game_manager.minion_type = minion_type

func took_minion():
	if i_took_minion:
		current_minion.global_position = $hand.global_position

















