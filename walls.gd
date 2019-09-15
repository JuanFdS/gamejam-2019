extends TileMap

signal team_win(team)
# Declare member variables here. Examples:
export var team : String
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func win():
	emit_signal("team_win", team)
#	self.get_tree().get_root().get_node("dungeon").get_node("win dialog").showWinFor(team)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
