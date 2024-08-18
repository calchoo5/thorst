extends Node3D
class_name World
@onready var dialogue_box = $DialogueBox
@onready var audio_player = $AudioStreamPlayer
static var _instance: World = null

@onready var me = load("res://assets/audio/sfx/ugh.ogg")
@onready var cashier = load("res://assets/audio/sfx/fire.wav")

func _ready():
	$block.show()
	$AnimationPlayer.play("reverseletter")
	await get_tree().create_timer(0.1).timeout
	$block.hide()
	await $AnimationPlayer.animation_finished
	_instance = self if _instance == null else _instance
	get_tree().paused = false
	dialogue_box.start()
	dialogue_box.custom_effects[0].char_displayed.connect(_on_char_displayed)

func _process(delta: float) -> void:
	if !%DialogueBox.visible:
		$"Basic FPS Player".ACCEL = 50
		$"Basic FPS Player".SPEED = 5
		$"Basic FPS Player".IN_AIR_SPEED = 3.0
		$"Basic FPS Player".IN_AIR_ACCEL = 5.0
		$"Basic FPS Player".JUMP_VELOCITY = 4.5
	elif %DialogueBox.visible:
		$"Basic FPS Player".ACCEL = 0
		$"Basic FPS Player".SPEED = 0
		$"Basic FPS Player".IN_AIR_SPEED = 0
		$"Basic FPS Player".IN_AIR_ACCEL = 0
		$"Basic FPS Player".JUMP_VELOCITY = 0


func _on_char_displayed(idx):
	# you can use the idx parameter to check the index of the character displayed
	# we'll just play an AudioStreamPlayer for this example
	if $DialogueBox.speaker_label.text == "Me":
		audio_player.volume_db = 0
		audio_player.pitch_scale = randf_range(0.9,1.1)
		audio_player.stream = me
		audio_player.play()
	if $DialogueBox.speaker_label.text == "Cashier":
		audio_player.pitch_scale = randf_range(0.5,0.8)
		audio_player.stream = cashier
		audio_player.volume_db = -10
		audio_player.play()
