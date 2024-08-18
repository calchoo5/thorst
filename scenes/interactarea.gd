extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func interact():
	if self.is_in_group("drink"):
		get_parent().position = Vector3(0,-50,0)
	print(get_parent().name)
	%DialogueBox.start_id = str(get_parent().name)
	%DialogueBox.start()
	pass
