extends Container

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var actualPosition = 0
const maxButtonsPerRow = 10
func createButton(button):
	var positionInMenu  = actualPosition
#	if(actualPosition <= maxButtonsPerRow):	
#		positionInMenu = actualPosition
#	else:
#		self.remove_child(get_children()[0])
#		actualPosition = 0	
#		positionInMenu = 0
	var bot1 = Button.new()
	bot1.set_size(Vector2(self.get_size().x / maxButtonsPerRow, (self.get_size().y / 3)))
	var row = round(positionInMenu / maxButtonsPerRow)
	var column = positionInMenu % maxButtonsPerRow
	bot1.set_position(Vector2(bot1.get_size().x * column, row * bot1.get_size().y))
	bot1.text = button.text
	bot1.disabled = true
	self.add_child(bot1)
	print("agregue")
	actualPosition +=1