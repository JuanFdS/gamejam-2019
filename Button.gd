extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var regla: GDScript = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func reglamento():
	return self.get_tree().get_root().get_node("dungeon").get_node("Reglamento")

func activateRule():
	regla.new().activar(self.reglamento())
