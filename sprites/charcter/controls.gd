extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sprite = get_node("Sprite")
var motion = Vector2()
var UP = Vector2(0,-1)
var jump = 0
var health = int(1000)
var die = preload("res://general/die.tscn")
const simple_shoot = preload("res://sprites/enemies/attacks/simple_shoot.tscn")
onready var timer = get_node("shoot_reload")
var reloadStat = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print("HELLO THER")
	$Sprite/Camera2D/HealthBar.value = health
	timer.set_wait_time(2)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#Movement and shid
	#Go to after the is_on_floor thing to see health
	if is_on_floor() == true:
		jump = 0
		motion.y = 400
	if is_on_floor() == false:
		if motion.y <= 390:
			motion.y += 18
			
	if Input.is_key_pressed(KEY_A):
		motion.x = -400
		sprite.flip_h = true
	elif Input.is_key_pressed(KEY_D):
		motion.x = 400
		sprite.flip_h = false
		
	#Jump stuff, don't touch idk how I got double jumping to work
	if (Input.is_key_pressed(KEY_W)):
		if jump < 3:
			if motion.y > -150:
#				print("UP UP")
#				print(jump)
				motion.y -= 400
				jump += 1
	else:
		if motion.x < 0:
			motion.x += 40
		elif motion.x > 0:
			motion.x -= 40
		else:
			motion.x = 0
	if health < 1000:
		health += 1
		var bar_health = int(health/100)
		$Sprite/Camera2D/HealthBar.value = health
	if health <= 0:
		print("died")
		die()
	move_and_slide(motion, UP)
	
	if (Input.is_action_just_pressed("ui_accept")):
		reloadStart = false
		pass

func _on_Area2D_body_entered(body):
	health -= 100

func die():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	image.save_png("general/test.png")
	get_tree().change_scene("res://general/die.tscn")


func _on_shootreload_timeout():
	pass # Replace with function body.
