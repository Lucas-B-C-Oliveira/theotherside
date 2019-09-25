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
	pass

### Manager Inputs
func move_input_manager():
	
	if Input.is_action_pressed("ui_right"):
		direction_x = 1
		anim_x = 1
		anim_y = 0
		$anim.play("run_right")
		
	elif Input.is_action_pressed("ui_left"):
		direction_x = -1
		anim_x = -1
		anim_y = 0
		$anim.play("run_left")
	else:
		direction_x = 0
		if direction_y == 0 and anim_y == 0:
			if anim_x == 1:
				$anim.play("idle_right")
			elif anim_x == -1:
				$anim.play("idle_left")
		elif direction_y == 0 and anim_y != 0:
			$anim.play("idle_down")
	
	if Input.is_action_pressed("ui_up"):
		direction_y = -1
		anim_y = 1
		anim_x = 0
		$anim.play("run_up")
	
	elif Input.is_action_pressed("ui_down"): 
		direction_y = 1
		anim_y = -1
		anim_x = 0
		$anim.play("run_down")
	else:
		direction_y = 0
		if direction_x == 0 and anim_x == 0:
			if anim_y == 1:
				$anim.play("idle_up")
			elif anim_y == -1:
				$anim.play("idle_down")
		elif direction_x == 0 and anim_x != 0:
			$anim.play("idle_up")


### Function of Movement
func move(delta):
	move_and_slide(Vector2(direction_x , direction_y) * speed * delta)


func get_minion(minion , minion_type):
	i_took_minion = true
	current_minion = minion
	game_manager.minion_type = minion_type

func took_minion():
	if i_took_minion:
		current_minion.global_position = $hand.global_position

















