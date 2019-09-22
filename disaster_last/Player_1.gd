extends KinematicBody2D

var gravity_force = 100
var move_speed = 400
var velocity = Vector2()

func _ready():
	$AnimationPlayer.play("LefttoRight")
	
func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= move_speed
	if Input.is_action_pressed("move_right"):
		velocity.x += move_speed
	
	if velocity.x > 0.1 or velocity.x < 0.1:
		$AnimationPlayer.play("LefttoRight")
	else:
		$AnimationPlayer.stop(true)
	velocity.y += gravity_force
	move_and_slide(velocity)
