extends StaticBody2D

var BALL_SCENE = preload("res://sprites/charcter/attacks/spell.tscn")


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	print("Will now shoot")
	var fireball = BALL_SCENE.instance()
	self.add_child(fireball)
	var position = self.global_position
	
#	fireball.position = position

	print(position)
	print(fireball.global_position)

	
	#global_position
	
#	fireball.global_position = thing.global_position 

#	var test = fireball.global_position()
#				if lookdir == 1:
#				spell.set_linear_velocity(-speed)
#			else:
#				spell.set_linear_velocity(speed)
#
#			free += 1
#			var ta = Timer.new()
#			ta.set_wait_time(1)
#			ta.set_one_shot(true)
#			self.add_child(ta)
#			ta.start()
#			yield(ta, "timeout")
#			spell.queue_free()
