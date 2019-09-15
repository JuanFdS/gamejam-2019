extends Node2D

# Declare member variables here. Examples:
# var a = 2
export var direction = "up"
var dungeon = null

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	dungeon = get_tree().get_root().get_node("dungeon")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WaveSpawnTimer_timeout():
	if randi() % 100 > 50:
		var randomTypeNumber = randi() % dungeon.UNIT_TYPES.size()
		var typeToCreate = load(dungeon.UNIT_TYPES[randomTypeNumber])
		dungeon.spawnUnit(typeToCreate, position, direction)

