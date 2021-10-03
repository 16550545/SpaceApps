extends Area2D
export (int) var Velocidad

signal hunger_changed
#ayuda a posicionar nuestro personaje
var Movimiento = Vector2()
var Limite
export var VidaMaxima = 100
export var HambreMax = 100
var Hambre 
var Sed
var Energia
var Oxigeno

# Called when the node enters the scene tree for the first time.
func _ready():
	Limite = get_viewport_rect().size
	var Vida = VidaMaxima
	Hambre = HambreMax
	Sed = 0
	Energia = 100
	Oxigeno = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2() #reinicia el valor
	#para ir a la derecha
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	#para ir a la izquierda
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -=1
	#verifica si se esta moviendo para normalizar la velocidad
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	#valor de posicion, actualiza los movimientos 
	position += Movimiento * delta
	position.x = clamp(position.x, 0, Limite.x)
	
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "Caminando"
		$AnimatedSprite.flip_h = Movimiento.x > 0
	else:
		$AnimatedSprite.animation = "Frente"
		
	Hambre -= .01
	emit_signal("hunger_changed", Hambre)
	if Hambre <= 00:
		print("le dio hambre")

