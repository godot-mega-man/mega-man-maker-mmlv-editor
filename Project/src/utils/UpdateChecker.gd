# UpdateChecker

extends Node

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Classes
#-------------------------------------------------

class ReleaseContent:
	extends Reference
	
	var request_response : Dictionary
	
	func has_content():
		return not request_response.empty()
	
	func get_description() -> String:
		return request_response["body"]
	
	func get_author_name() -> String:
		return request_response["author"]["login"]
	
	func get_download_url() -> String:
		return request_response["assets"][0]["browser_download_url"]
	
	func get_version() -> String:
		return request_response["name"]
	
	func get_publish_date_raw() -> String:
		return request_response["published_at"]
	
	func get_file_size_raw() -> String:
		return request_response["assets"][0]["size"]
	
	func get_file_size() -> String:
		return String.humanize_size(get_file_size_raw() as int)
	
	func is_latest(current_version : String) -> bool:
		return VersionComparator.compare(current_version, get_version()) >= 0

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal up_to_date
signal update_available

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const GITHUB_API = "https://api.github.com/repos/godot-mega-man/mega-man-maker-mmlv-editor/"
const LATEST_RELEASE = "releases/latest"

const AUTO_CHECK_COOLDOWN_FILE = "user://AutoCheckUpdateCooldown.dat"
const AUTO_CHECK_COOLDOWN = 61200 # in seconds

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var http_request = $HTTPRequest

var release_content := ReleaseContent.new()
var notify_on_complete : bool

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func request(notify : bool = true):
	notify_on_complete = notify
	http_request.request(GITHUB_API + LATEST_RELEASE)
	yield(http_request, "request_completed")
	_check()

func is_auto_check_on_cooldown() -> bool:
	var f = File.new()
	var err = f.open(AUTO_CHECK_COOLDOWN_FILE, File.READ)
	var last_check_unix : int
	
	if err != OK:
		return false
	
	last_check_unix = f.get_var()
	
	return OS.get_unix_time() - last_check_unix < AUTO_CHECK_COOLDOWN

func apply_auto_check_cooldown():
	var f = File.new()
	f.open(AUTO_CHECK_COOLDOWN_FILE, File.WRITE)
	f.store_var(OS.get_unix_time())
	f.close()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	release_content.request_response = parse_json(body.get_string_from_utf8())

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _get_proj_version() -> String:
	return ProjectSettings.get_setting("application/config/version")

func _check():
	if not release_content.has_content():
		return
	if release_content.is_latest(_get_proj_version()) and notify_on_complete:
		emit_signal("up_to_date")
	if not release_content.is_latest(_get_proj_version()):
		emit_signal("update_available")
		
		if not notify_on_complete: # Not manually checks by user
			apply_auto_check_cooldown()
