# EditorSplash
# Written by: First

extends CanvasLayer

#class_name optional

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const LOADING_MESSAGE_JSON_FILE_PATH = "res://src/game_database/database/loading_messages.json"
const LOAD_DONE_MSG = "Done!"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

var res_iloader : ResourceInteractiveLoader
var current_scene 
var thread : Thread

var load_finished : bool = false #Avoid duplicate instancing on GPU processor

onready var loading_label = $Panel/IconSplash/LoadingVbox/LoadingLabel
onready var progress_bar = $Panel/IconSplash/LoadingVbox/ProgressBar

onready var watermark_hbox = $Panel/WatermarkHBox
onready var watermark_label_proj_name = $Panel/WatermarkHBox/WatermarkLabelProjName
onready var watermark_label_proj_version = $Panel/WatermarkHBox/WatermarkLabelProjVersion
onready var watermark_label_creator = $Panel/WatermarkHBox/WatermarkLabelCreator

onready var hint_label = $Panel/HintLabel

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	thread = Thread.new()
	
	_update_watermark()
	res_iloader = ResourceLoader.load_interactive("res://src/scenes/editor/editor.tscn")
	
	_play_anims()
	_randomize_hint_text()

func _input(event: InputEvent) -> void:
	_test_randomize_hint_text(event)

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_LoadDoneCheckTimer_timeout() -> void:
	if thread.is_active():
		return
	
	thread.start(self, "start_poll", "")

func _poll_finished():
	var err = thread.wait_to_finish()
	
	if err == null:
		return 
	if res_iloader == null:
		return
	if load_finished:
		return
	
	if err == ERR_FILE_EOF: # Finished loading.
		var resource = res_iloader.get_resource()
		_set_new_scene(resource)
		call_deferred("queue_free")
		load_finished = true
	elif err == OK:
		_update_progress()
	else: #Error during loading
		res_iloader = null
		return

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func start_poll(_nth) -> int:
	var err = res_iloader.poll()
	call_deferred("_poll_finished")
	return err

func _update_progress():
	progress_bar.set_min(0)
	progress_bar.set_max(int(res_iloader.get_stage_count()))
	progress_bar.set_value(int(res_iloader.get_stage()))

func _set_new_scene(resource : PackedScene):
	current_scene = resource.instance()
	get_node("/root").add_child(current_scene)

func _update_watermark():
	watermark_label_proj_name.text = ProjectSettings.get_setting("application/config/name")
	watermark_label_proj_version.text = "v" + ProjectSettings.get_setting("application/config/version")
	watermark_label_creator.text = ProjectSettings.get_setting("application/config/project_creator")

func _play_anims():
	if EditorConfig.reduced_motion:
		return
	
	$Panel/IconSplash/ShowAnim.play("Show")
	$Panel/WatermarkHBox/ShowAnim.play("Anim")

func _randomize_hint_text():
	randomize() # Randoms the seed of the random number generator (rnd)
	print_debug("Seed: randomize() was used")
	hint_label.text = DataHints.get_random_hint()

func _test_randomize_hint_text(event : InputEvent):
	assert(event != null)
	
	if not event is InputEventMouseButton:
		return
	if not event.is_pressed():
		return
	if not (event as InputEventMouseButton).button_index == BUTTON_LEFT:
		return
	
	_randomize_hint_text()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
