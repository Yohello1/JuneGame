extends StaticBody2D

var BALL_SCENE = preload("res://sprites/charcter/attacks/spell.tscn")
var speed = Vector2(200, 0)


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var fireball = BALL_SCENE.instance()
	self.add_child(fireball)
	var position = Vector2(-3,-9)
	fireball.set_linear_velocity(speed)
	fireball.position = position
	
	var fireball2 = BALL_SCENE.instance()
	self.add_child(fireball2)
	var position2 = Vector2(3,-9)
	fireball2.set_linear_velocity(-speed)
	fireball2.position = position
	
	yield(get_tree().create_timer(1), "timeout")
	fireball.queue_free()
	fireball2.queue_free()
