extends Node2D

var test_array: Array[String] = ["Test", "Hello", "stuff"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Logo.rotation_degrees = 90
	
	print(test_array[0])
	print(%Target)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Logo.rotation_degrees += 100 * delta
		
	if $Logo.pos.x > 1000:
		$Logo.pos.x = 0

func test_function():
	print("this is a test funtion")
