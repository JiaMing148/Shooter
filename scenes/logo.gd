extends Sprite2D

var pos: Vector2 = Vector2.ZERO
var test_sacle: int = 1
const speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pos = Vector2(200,300)
	test_sacle = 2
	position = pos
	scale = Vector2(test_sacle, test_sacle)
	
	var text_rotation = 45
	rotation_degrees = text_rotation
	
	print($"..".test_array[2])
	$"..".test_function()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pos.x += speed * delta
	position = pos
	#test_sacle += 0.1
	#scale = Vector2(test_sacle, test_sacle)
