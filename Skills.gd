extends Container

# Declare member variables here. Examples:
const powers = [
	{"name":"troll X4","rule":"duplicarVelocidadTroll"},
	{"name":"amarillo X4","rule":"aumentarAmarillo"},
	{"name":"trolls -> amarillos","rule":"cambiarTrollsPorAmarillos"},
	{"name":"amarillos -> trolls","rule":"cambiarAmarillosPorTrolls"},
	{"name":"X0.5","rule":"reducirVelocidadTroll"},
	{"name":"reverse trolls","rule":"reverseTrollDirection"}
]

var reglamento = null
var activeSkills = null

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	reglamento = get_tree().get_current_scene().get_node("Reglamento")
	activeSkills = get_tree().get_current_scene().get_node("ActiveSkills")
	if(get_children().size() == 0):
			createButton(0)
			createButton(1)
			createButton(2)

func createButton(positionInMenu):
	var bot1 = Button.new()
	bot1.set_size((self.get_size() / 3))
	bot1.set_position(bot1.get_position() + positionInMenu*Vector2(bot1.get_size().x,0))
	self.add_child(bot1)
	var skillNumber = randi()%powers.size() 
	print(skillNumber)
	bot1.connect("pressed", self, "handleButtonPressed", [powers[skillNumber].rule, bot1, positionInMenu])
	bot1.text = powers[skillNumber].name

func removeButton(button):
	self.remove_child(button)
	button.queue_free()

func handleButtonPressed(rule, button, positionInMenu):
	reglamento.call(rule)
	var ruleName = button.text
	self.removeButton(button)
	createButton(positionInMenu)
	activeSkills.createButton(ruleName)
