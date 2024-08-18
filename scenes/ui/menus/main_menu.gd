extends Control

@onready var game_menu: Control = %GameMenu
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var main_menu = %MainMenu
@onready var buttons_v_box = %ButtonsVBox
signal start_game()

func _ready() -> void:
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_game_button_pressed() -> void:
	animation_player.play("letter")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Gameplay/Levels/main.tscn") #Goes to the main world scene.
	hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
