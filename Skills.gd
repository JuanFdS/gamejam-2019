extends Container
var SkillButton = load("res://SkillButton.gd")
# Declare member variables here. Examples:


export var player : int

var powers : Array

var playersSkills = {
	1:[KEY_Q,KEY_W,KEY_E],
	2:[KEY_B,KEY_N,KEY_M]
}

func createPower(name, rule, affectedUnit):
	return {"name": name, "rule": rule, "params": {"affectedUnit": load(affectedUnit)}, "player": player}

var reglamento = null
var activeSkills = null

# Called when the node enters the scene tree for the first time.
func _ready():
	powers = [
	createPower("troll X4","duplicarVelocidad", "troll.gd"),
	createPower("amarillo X4","duplicarVelocidad", "amarillo.gd"),
	createPower("trolls -> amarillos","cambiarPorAmarillos", "troll.gd"),
	createPower("amarillos -> trolls","cambiarPorTrolls", "amarillo.gd"),
	createPower("X0.5","reducirVelocidad",  "troll.gd"),
	createPower("reverse trolls","reverseDirection", "troll.gd"),
	createPower("reverse amarillos","reverseDirection", "amarillo.gd"),
	{"name": "Move right yogur", "rule": "moveLine", "params": {"affectedUnit": load("amarillo.gd"), "offset": Vector2(15,45)}},
    {"name": "Move right leche", "rule": "moveLine", "params": {"affectedUnit": load("troll.gd"), "offset": Vector2(15,45)}},
    {"name": "Move left yogur", "rule": "moveLine", "params": {"affectedUnit": load("amarillo.gd"), "offset": Vector2(-15,-45)}},
    {"name": "Move left leche", "rule": "moveLine", "params": {"affectedUnit": load("troll.gd"), "offset": Vector2(-15,-45)}}]
	randomize()
	reglamento = get_tree().get_current_scene().get_node("Reglamento")
	activeSkills = get_tree().get_current_scene().get_node("ActiveSkills")
	if(get_children().size() == 0):
		_re_role_skills()

func _re_role_skills():
	print("HOLUS")
	for child in get_children():
		removeButton(child)
	createButton(0)
	createButton(1)
	createButton(2)
	
func createButton(positionInMenu):
	var bot1 = SkillButton.new()
	bot1.key = playersSkills[player][positionInMenu]
	bot1.player = player
	bot1.set_size((self.get_size() / 3))
	bot1.set_position(bot1.get_position() + positionInMenu * Vector2(bot1.get_size().x, 0))
	self.add_child(bot1)
	var skillNumber = randi() % powers.size()
	bot1.connect("pressed", self, "handleButtonPressed", [powers[skillNumber], bot1, positionInMenu])
	bot1.text = powers[skillNumber].name

func removeButton(button):
	self.remove_child(button)
	button.queue_free()

func handleButtonPressed(skill, button, positionInMenu):
	print(skill)
	reglamento.activateSkill(skill)
	var ruleName = button.text
	activeSkills.createButton(ruleName)


func _on_Reglamento_re_role_skills():
		_re_role_skills()
