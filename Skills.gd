extends Container

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func createButton(positionInMenu):
	var bot1 = Button.new()
	bot1.set_size((self.get_size() / 3))
	bot1.set_position(bot1.get_position() + positionInMenu*Vector2(bot1.get_size().x,0))
	self.add_child(bot1)
	var powers = [{"name":"X4","handler":"ruleX4Speed"},
	{"name":"X0.5","handler":"ruleXMedioSpeed"},
	{"name":"reverse","handler":"changeDirection"}]
	randomize()
	var skillNumber = randi()%3 
	print(skillNumber)
	bot1.connect("pressed",self,powers[skillNumber].handler,[bot1, positionInMenu])
	bot1.text = powers[skillNumber].name

func ruleX4Speed(button, positionInMenu):
	get_tree().get_current_scene().trollSpeed *= 4
	self.remove_child(button)
	createButton(positionInMenu)
	get_tree().get_current_scene().get_node("ActiveSkills").createButton(button)
	
func ruleXMedioSpeed(button, positionInMenu):
	get_tree().get_current_scene().trollSpeed *= 0.5
	self.remove_child(button)
	createButton(positionInMenu)
	get_tree().get_current_scene().get_node("ActiveSkills").createButton(button)
	
func changeDirection(button, positionInMenu):
	get_tree().get_current_scene().trollDirection *= (-1)
	self.remove_child(button)
	createButton(positionInMenu)
	get_tree().get_current_scene().get_node("ActiveSkills").createButton(button)
	
func _process(delta):
	if(get_children().size() == 0):
		createButton(0)
		createButton(1)
		createButton(2)