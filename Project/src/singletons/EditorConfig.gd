# EditorConfig (Singleton)

extends Node

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const CONFIG_DIR = "user://Settings"
const CONFIG_FILENAME = "Editor.cfg"

const CFG_SECTION = "Settings"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

export var auto_check_update : bool = true

export var reduced_motion : bool
export var locked_keyboard : bool

export var camera_smoothness : int = 15
export var camera_smoothness_min : int = 0
export var camera_smoothness_max : int = 300

export var max_recent_files : int = 7
export var max_recent_files_min : int = 1
export var max_recent_files_max : int = 999

export var fps : int = 0
export var fps_min : int = 0
export var fps_max : int = 9999

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_load_init_config()
	_update_engine_config()

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func save():
	var cfg = ConfigFile.new()
	cfg.set_value(CFG_SECTION, "auto_check_update", auto_check_update)
	cfg.set_value(CFG_SECTION, "camera_smoothness", camera_smoothness)
	cfg.set_value(CFG_SECTION, "reduced_motion", reduced_motion)
	cfg.set_value(CFG_SECTION, "max_recent_files", max_recent_files)
	cfg.set_value(CFG_SECTION, "locked_keyboard", locked_keyboard)
	cfg.set_value(CFG_SECTION, "fps", fps)
	cfg.save(CONFIG_DIR.plus_file(CONFIG_FILENAME))
	
	_update_engine_config()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _load_init_config():
	var dir = Directory.new()
	if not dir.dir_exists(CONFIG_DIR):
		dir.make_dir(CONFIG_DIR)
	
	var cfg = ConfigFile.new()
	var err = cfg.load(CONFIG_DIR.plus_file(CONFIG_FILENAME))
	if err != OK:
		if err != ERR_FILE_NOT_FOUND:
			EditorLogBox.add_message("There was an error while loading editor settings. Returned err code: %s" % err, true)
		return
	if not cfg.has_section(CFG_SECTION):
		EditorLogBox.add_message("EditorConfig has section \"%s\" missing. Reverting editor settings to default." + CFG_SECTION, true)
		return
	
	auto_check_update = cfg.get_value(CFG_SECTION, "auto_check_update", auto_check_update)
	camera_smoothness = cfg.get_value(CFG_SECTION, "camera_smoothness", camera_smoothness)
	reduced_motion = cfg.get_value(CFG_SECTION, "reduced_motion", reduced_motion)
	locked_keyboard = cfg.get_value(CFG_SECTION, 'locked_keyboard', locked_keyboard)
	max_recent_files = cfg.get_value(CFG_SECTION, "max_recent_files", max_recent_files)
	fps = cfg.get_value(CFG_SECTION, "fps", fps)

func _update_engine_config():
	Engine.target_fps = fps
