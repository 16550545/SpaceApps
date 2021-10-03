extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/Background/Number
onready var bar = $Bars/LifeBar/Gauge
onready var tween = $Tween

func _ready():
	var player_max_hunger = $"../Personaje".HambreMax
	bar.max_value = player_max_hunger
	update_hunger(player_max_hunger)


func _on_Personaje_hunger_changed(player_hunger):
	update_hunger(player_hunger)

func update_hunger(new_value):
	number_label.text = str(round(new_value))
	bar.value = new_value
