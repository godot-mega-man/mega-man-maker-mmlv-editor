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

onready var loading_label = $Panel/LoadingVbox/LoadingLabel
onready var progress_bar = $Panel/LoadingVbox/ProgressBar


#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	thread = Thread.new()
	
	_update_loading_message()
	res_iloader = ResourceLoader.load_interactive("res://src/scenes/editor/editor.tscn")

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
	
	if err == ERR_FILE_EOF: # Finished loading.
		var resource = res_iloader.get_resource()
		res_iloader = null
		_set_new_scene(resource)
		queue_free()
		return
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

func _update_loading_message():
	var f = File.new()
	var f_open_result = f.open(LOADING_MESSAGE_JSON_FILE_PATH, File.READ)
	
	if f_open_result == OK:
		var text = f.get_as_text()
		var json_data = parse_json(text)
		
		randomize()
		loading_label.set_text(json_data.data[randi() % json_data.data.size() - 1])
	
	f.close()

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
