extends KinematicBody2D

enum{
	move,
	roll,
	attack,
}

const roll_speed = 150
const maxSpeed = 120
const acceleration = 500
const friction = 500
onready var animationDirector = $AnimationTree
onready var animationScript = animationDirector.get("parameters/playback")
onready var swordhitmanager = $hitboxpivot/swordhitbox
var state = move
var velocity = Vector2.ZERO
var roll_vector = Vector2.RIGHT

func _process(_delta):
	match state:
		move:
			move_state(_delta)
		roll:
			roll_state(_delta)
		attack:
			attack_state(_delta)

func move_state(_delta):
	var right = Input.get_action_strength("ui_right")
	var left = Input.get_action_strength("ui_left")
	var up = Input.get_action_strength("ui_up")
	var down = Input.get_action_strength("ui_down")
	var input_vector = Vector2.ZERO
	input_vector.x = right - left
	input_vector.y = down - up
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		animationDirector.set("parameters/idle/blend_position", input_vector)
		animationDirector.set("parameters/run/blend_position", input_vector)
		animationDirector.set("parameters/attack/blend_position", input_vector)
		animationDirector.set("parameters/roll/blend_position", input_vector)
		animationScript.travel("run")
		velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * _delta)
	else:
		animationScript.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * _delta)
	move()

	if Input.is_action_just_pressed("Roll"):
		state = roll
	if Input.is_action_just_pressed("ATTACK!"):
		state = attack

func roll_state(_delta):
	velocity = roll_vector * roll_speed 
	animationScript.travel("roll")
	move()

func move():
	velocity = move_and_slide(velocity)

func attack_state(_delta):
	animationScript.travel("attack")

func attack_finished():
	state = move
	velocity = Vector2.ZERO

func roll_finished():
	state = move
