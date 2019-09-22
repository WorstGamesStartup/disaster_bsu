extends KinematicBody2D

var gravity_force = 100
var velocity = Vector2()

func _ready():
	$AnimationPlayer.play("LefttoRight")
	
func _physics_process(delta):
	velocity = Input.is_action_pressed("move_left") - Input.is_action_pressed("move_right")
	velocity.y += gravity_force
	move_and_slide(velocity)
