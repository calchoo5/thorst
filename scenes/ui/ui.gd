extends CanvasLayer
class_name UI

signal start_game()
signal menu_opened()
signal menu_closed()
signal quit_to_menu()

@onready var game_menu: Control = %GameMenu
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var main_menu = %MainMenu

static var _instance: UI = null

var letterbox_open := false
	
func _ready():
	$block.show()
	$AnimationPlayer.play_backwards("letter")
	await get_tree().create_timer(0.1).timeout
	$block.hide()
	await $AnimationPlayer.animation_finished
	_instance = self if _instance == null else _instance


func _on_main_menu_start_game() -> void:
	start_game.emit()


func _on_menu_main_menu():
	if animation_player.is_playing():
		await animation_player.animation_finished
	game_menu.hide()
	quit_to_menu.emit()
	main_menu.show()


func _on_menu_return_to_game():
	if animation_player.is_playing():
		await animation_player.animation_finished
	game_menu.hide()
	menu_closed.emit()
