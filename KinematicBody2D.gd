extends KinematicBody2D

export (int) var speed = 300

var velocity = Vector2()

onready var _animated_sprite = $AnimatedSprite

#func _process(_delta):
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		_animated_sprite.play("right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		_animated_sprite.play("left")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		_animated_sprite.play("up")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		_animated_sprite.play("down")				
	else:
		_animated_sprite.stop()
	velocity = velocity.normalized() * speed
		
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
func _on_CollisionShape2D_tree_exited():
	print('Hellow') # Replace with function body.
