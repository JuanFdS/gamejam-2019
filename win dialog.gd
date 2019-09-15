extends ConfirmationDialog

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func showWinFor(team):
	self.visible = true
	self.dialog_text = "gano el equipo " + team


func _on_win_dialog_confirmed():
	get_tree().reload_current_scene()
