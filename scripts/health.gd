extends HBoxContainer

@export var max_health := 5
var health := 5

@export var full_heart: Texture2D
@export var empty_heart: Texture2D

func _ready():
	update_hearts()
	
func update_hearts():
	for child in get_children():
		child.queue_free()

	for i in range(max_health):
		var heart = TextureRect.new()

		if i < health:
			heart.texture = full_heart
		else:
			heart.texture = empty_heart

		add_child(heart)

#call func: $UI/hearts.take_damage(1)
func take_damage(amount):
	health -= amount
	health = clamp(health, 0, max_health)
	update_hearts()

func heal(amount):
	health += amount
	health = clamp(health, 0, max_health)
	update_hearts()
