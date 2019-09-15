extends Container

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var actualPosition = 0
const maxButtonsPerRow = 5
func createButton(ruleName):
	var positionInMenu  = actualPosition
	var bot1 = Button.new()
	bot1.set_size(Vector2(self.get_size().x / maxButtonsPerRow, (self.get_size().y / 3)))
	var row = round(positionInMenu / maxButtonsPerRow)
	var column = positionInMenu % maxButtonsPerRow
	bot1.set_position(Vector2(bot1.get_size().x * column, row * bot1.get_size().y))
	bot1.text = ruleName
	bot1.disabled = true
	self.add_child(bot1)
	actualPosition +=1