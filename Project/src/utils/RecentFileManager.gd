# RecentFileManager

extends Reference

class_name RecentFileManager

"""
	Responsible for keeping recent opened files as path, adding new one, and
	clearing all the history.
"""

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const RECENT_FILE_DATA_DIR = "user://Settings"
const RECENT_FILE_DATA_FILENAME = "RecentFiles.cfg"

const CFG_SECTION = "RecentFiles"
const CFG_SECTION_KEY = "list"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

var recent_file_paths : Array
var max_item : int = 4

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func load_init_config():
	var dir = Directory.new()
	if not dir.dir_exists(RECENT_FILE_DATA_DIR):
		dir.make_dir(RECENT_FILE_DATA_DIR)
	
	var cfg = ConfigFile.new()
	var err = cfg.load(RECENT_FILE_DATA_DIR.plus_file(RECENT_FILE_DATA_FILENAME))
	if err != OK:
		if err != ERR_FILE_NOT_FOUND:
			EditorLogBox.add_message("There was an error while loading recent files history. Returned err code: %s" % err, true)
		return
	if not cfg.has_section(CFG_SECTION):
		EditorLogBox.add_message("RecentFile configuration has section \"%s\" missing. Can't read recently opened files." + CFG_SECTION, true)
		return
	if not cfg.has_section_key(CFG_SECTION, CFG_SECTION_KEY):
		EditorLogBox.add_message("RecentFile configuration has section key \"%s\" missing. Operation aborted." % CFG_SECTION_KEY, true)
		return
	
	recent_file_paths = cfg.get_value(CFG_SECTION, CFG_SECTION_KEY)

func add(path):
	# Look for duplication. If found, remove it
	if recent_file_paths.has(path):
		recent_file_paths.remove(recent_file_paths.find(path))
	
	# Insert at the beginning of the list
	recent_file_paths.push_front(path)
	recent_file_paths = recent_file_paths.slice(0, max_item-1, 1, true) # Cap at max n item
	_save_config()

func clear():
	recent_file_paths.clear()
	_save_config()

func get_recent_file_paths() -> Array:
	return recent_file_paths

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

# Saves recent opened files config
func _save_config():
	var cfg = ConfigFile.new()
	cfg.set_value(CFG_SECTION, CFG_SECTION_KEY, recent_file_paths)
	cfg.save(RECENT_FILE_DATA_DIR.plus_file(RECENT_FILE_DATA_FILENAME))

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
