extends MeshInstance3D

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.connect()
	pass
		
		
func _on_basic_fps_player_interacting() -> void:
	print("gdfssfgadgsdfa")
	self.position = Vector3(0,-50,0)
	
