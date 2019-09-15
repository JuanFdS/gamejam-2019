extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var trollSpeed = 160
var trollDirection = Vector2(2,-1)
var yellowTrollSpeed = 200
var reglas = Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func trollSpeed():
	return trollSpeed
	
func yellowTrollSpeed():
	return yellowTrollSpeed
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func duplicarVelocidadTroll():
	trollSpeed *= 4
	
func reducirVelocidadTroll():
	trollSpeed /= 4
	
func aumentarAmarillo():
	yellowTrollSpeed *= 4

func dungeon():
	return get_tree().get_root().get_node("dungeon")

func replaceUnits(scriptFromUnitsToReplace, scenesOfUnitsToSpawn):
	for unit in dungeon().unitsWith(scriptFromUnitsToReplace):
		var unitPosition = unit.position
		unit.destroy()
		dungeon().spawnUnit(load(scenesOfUnitsToSpawn), unitPosition)

func cambiarTrollsPorAmarillos():
	replaceUnits("troll.gd", "res://amarillo.tscn")

func cambiarAmarillosPorTrolls():
	replaceUnits("amarillo.gd", "res://troll.tscn")
	
func reverseTrollDirection():
	trollDirection *= (-1)
