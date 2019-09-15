extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Troll = preload("troll.gd")
const Amarillo = preload("amarillo.gd")
var reglas = Array()

var forward = Vector2(2,-1)
var backward = forward * (-1)

const baseTrollSpeed = 80
const baseAmarilloSpeed = 100

signal re_role_skills()

var stats = {
		Troll: {
				"baseSpeed": baseTrollSpeed,
				"speed": baseTrollSpeed,
				"direction": forward,
				"xOffset": 0,
			},
		Amarillo: {
				"baseSpeed": baseAmarilloSpeed,
				"speed": baseAmarilloSpeed,
				"direction": forward,
				"xOffset": 0,
			}
	}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activateSkill(skill):
	call(skill.rule, skill.get("params", []))
	emit_signal("re_role_skills")


func stat(unit, statName):
	return stats[unit][statName]

func setStat(unit, statName, newStat):
	stats[unit][statName] = newStat

func baseSpeed(unit):
	return stat(unit, "baseSpeed")

func speed(unit):
	return stat(unit, "speed")

func setSpeed(unit, newSpeed):
	setStat(unit, "speed", newSpeed)

func xOffset(unit):
	return stat(unit, "xOffset")

func setxOffset(unit, newxOffset):
	setStat(unit, "xOffset", newxOffset)

func direction(unit):
	return stat(unit, "direction")

func setDirection(unit, newDirection):
	setStat(unit, "direction", newDirection)

func duplicarVelocidad(params):
	var unit = params.affectedUnit
	setSpeed(unit, baseSpeed(unit) * 2)

func reducirVelocidad(params):
	var unit = params.affectedUnit
	setSpeed(unit, baseSpeed(unit) / 2)

func dungeon():
	return get_tree().get_root().get_node("dungeon")

func replaceUnits(type, scenesOfUnitsToSpawn):
	for unit in dungeon().unitsOfType(type):
		var unitPosition = unit.position
		var unitDirection = unit.direction
		unit.destroy()
		dungeon().spawnUnit(load(scenesOfUnitsToSpawn), unitPosition, unitDirection)

func cambiarPorAmarillos(params):
	replaceUnits(params.affectedUnit, "res://amarillo.tscn")

func cambiarPorTrolls(params):
	replaceUnits(params.affectedUnit, "res://troll.tscn")

func reverseDirection(params):
	var unit = params.affectedUnit
	setDirection(unit, direction(unit) * (-1))

func moveLine(params):
	var unitType = params.affectedUnit
	var offset = params.offset
	for unit in dungeon().unitsOfType(unitType):
		unit.position = unit.position + offset

