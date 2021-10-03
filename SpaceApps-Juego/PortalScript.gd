extends Area2D
export (String) var Room

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Portal_area_entered(area):
	print(area)
	if area.name == "Personaje":
		print("hola")
		get_tree().change_scene("res://Room2.tscn")
