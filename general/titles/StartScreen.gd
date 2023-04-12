extends Sprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _on_Sprite_input_event( viewport, event, shape_idx ):
#	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
#		print("Clicked")


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	print(event)
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("CLICKED")
				get_tree().change_scene("res://levels/FirstLevel.tscn")
