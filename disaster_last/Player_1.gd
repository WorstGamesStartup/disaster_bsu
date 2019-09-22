extends KinematicBody2D

var gravity_force = 100
var move_speed = 400
var facing_left = false
var velocity = Vector2()

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
	else:
		$AnimationPlayer.stop(true)	
		
	velocity.y += gravity_force
	move_and_slide(velocity)
