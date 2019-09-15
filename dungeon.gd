extends Node2D

func spawnUnit(unitScene, position):
	var newUnit = unitScene.instance()
	newUnit.position = position
	self.add_child(newUnit)

func unitsOfType(type):
	var units = []
	for unit in get_children():
		if(unit.get_script() && unit.get_script() == type):
			units.append(unit)
	return units

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass