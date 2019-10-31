extends KinematicBody2D

# Var's Move
var direction_x = 0
var direction_y = 0
var speed = 10000

# Var's Anim of Player
var anim_x = 0
var anim_y = 0

var life = 100
var damaged = false

var blue_box = false

func _ready():
	pass 

func _input(event):
	move_input_manager()


func _physics_process(delta):
	move(delta)

func _process(delta):
	move_input_manager()

### Manager Inputs
func move_input_manager():
	
	var UI_Vertical_Check = !Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down")
	var UI_Horizontal_Check = !Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left")
	
	if !damaged:
		
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
			
		elif UI_Vertical_Check:
			direction_x = 0
			$anim.play("idle_down")
		else:
			direction_x = 0
		
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
			
		elif UI_Horizontal_Check:
			direction_y = 0
			$anim.play("idle_down")
		else:
			direction_y = 0
	else:
		if Input.is_action_pressed("ui_right"):
			direction_x = 1
			anim_x = 1
			anim_y = 0
			$anim.play("run_right_damage")
			
		elif Input.is_action_pressed("ui_left"):
			direction_x = -1
			anim_x = -1
			anim_y = 0
			$anim.play("run_left_damage")
			
		elif UI_Vertical_Check:
			direction_x = 0
			$anim.play("idle_down_damage")
		else:
			direction_x = 0
		
		if Input.is_action_pressed("ui_up"):
			direction_y = -1
			anim_y = 1
			anim_x = 0
			$anim.play("run_up_damage")
		
		elif Input.is_action_pressed("ui_down"): 
			direction_y = 1
			anim_y = -1
			anim_x = 0
			$anim.play("run_down_damage")
			
		elif UI_Horizontal_Check:
			direction_y = 0
			$anim.play("idle_down_damage")
		else:
			direction_y = 0



### Function of Movement
func move(delta):
	move_and_slide(Vector2(direction_x , direction_y) * speed * delta)

func set_damage(value):
	
	if life < 0:
		playerDie()
	
	life -= value
	
	if value > 93:
		damaged = true
		$Timer_Damaged.start(.4)
	elif value > 83 and value <= 93:
		damaged = true
		$Timer_Damaged.start(.4)
	elif value <= 83 and value > 50:
		damaged = true
		$Timer_Damaged.start(.4)
	elif value <= 50:
		damaged = true
		$Timer_Damaged.start(.4)
	
	print(life)


func _on_Timer_Damaged_timeout():
	damaged = false

func playerDie():
	get_parent().restartGame()
