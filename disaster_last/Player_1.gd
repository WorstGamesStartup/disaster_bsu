extends KinematicBody2D

var gravity_force = 100
var velocity = Vector2()

func _ready():
	$AnimationPlayer.play("LefttoRight")
	
func _physics_process(delta):
	velocity.y += gravity_force
	move_and_slide(velocity)
