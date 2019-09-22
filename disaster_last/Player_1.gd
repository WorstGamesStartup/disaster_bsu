extends KinematicBody2D

var gravity_force = 400
var move_speed = 400
var facing_left = false
var velocity = Vector2()


func _ready():
	var limit = get_parent().get_node("camera_limit").position
	$Camera2D.limit_left = limit.x
	$Camera2D.limit_bottom = limit.y
	var limit2 = get_parent().get_node("camera_limit2").position
	$Camera2D.limit_right = limit2.x

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		if !facing_left:
			$".".scale.x *= -1
		facing_left = true
		velocity.x -= move_speed
	if Input.is_action_pressed("move_right"):
		if facing_left:
			$".".scale.x *= -1
		facing_left = false
		velocity.x += move_speed
	
	if velocity.x != 0:
		$AnimationPlayer.play("LefttoRight")
		$Particles2D.emitting = true
	else:
		$AnimationPlayer.play("Idle")	
		$Particles2D.emitting = false
		
	velocity.y += gravity_force
	move_and_slide(velocity)
