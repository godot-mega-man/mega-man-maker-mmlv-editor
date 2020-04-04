# LevelTab
# Written by: First

extends MainInspectorTab

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

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var atb_hbox_version = $ScrollContainer/Vbox/AtbHboxVersion
onready var atb_hbox_level_name = $ScrollContainer/Vbox/AtbHboxLevelName
onready var atb_hbox_username = $ScrollContainer/Vbox/AtbHboxUsername
onready var atb_hbox_user_portrait = $ScrollContainer/Vbox/AtbHboxUserPortrait
onready var atb_hbox_sliding = $ScrollContainer/Vbox/AtbHboxSliding
onready var atb_hbox_cshot_on = $ScrollContainer/Vbox/AtbHboxCShotOn
onready var atb_hbox_dbl_dmg = $ScrollContainer/Vbox/AtbHboxDblDmg
onready var atb_hbox_proto_strike = $ScrollContainer/Vbox/AtbHboxProtoStrike
onready var atb_hbox_dbl_jump = $ScrollContainer/Vbox/AtbHboxDblJump
onready var atb_hbox_cshot_type = $ScrollContainer/Vbox/AtbHboxCShotType
onready var atb_hbox_bg_color_id = $ScrollContainer/Vbox/AtbHboxBgColorID
onready var atb_hbox_boss_portrait = $ScrollContainer/Vbox/AtbHboxBossPortrait
onready var atb_hbox_boss_count = $ScrollContainer/Vbox/AtbHboxBossCount
onready var atb_hbox_lvl_track_id = $ScrollContainer/Vbox/AtbHboxLvlTrackID
onready var atb_hbox_lvl_music_number = $ScrollContainer/Vbox/AtbHboxLvlMusicNumber
onready var atb_hbox_area_p = $ScrollContainer/Vbox/AtbHboxAreaP
onready var atb_hbox_area_q = $ScrollContainer/Vbox/AtbHboxAreaQ
onready var atb_hbox_area_r = $ScrollContainer/Vbox/AtbHboxAreaR
onready var atb_hbox_area_s = $ScrollContainer/Vbox/AtbHboxAreaS

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#Called by InspectorPanel.
#Usually happen when a level file is loaded.
func load_properties_from_level():
	clear_all_properties()
	
	var level = get_tree().get_nodes_in_group("Level").back()
	
	if level is Level:
		atb_hbox_version.set_value(level.level_version)
		atb_hbox_level_name.set_value(level.level_name)
		atb_hbox_username.set_value(level.user_name)
		atb_hbox_user_portrait.set_value(level.user_icon_id)
		atb_hbox_sliding.set_value(level.sliding)
		atb_hbox_cshot_on.set_value(level.charge_shot_enable)
		atb_hbox_dbl_dmg.set_value(level.double_damage)
		atb_hbox_proto_strike.set_value(level.proto_strike)
		atb_hbox_dbl_jump.set_value(level.double_jump)
		atb_hbox_cshot_type.set_value(level.charge_shot_type)
		atb_hbox_bg_color_id.set_value(level.default_background_color)
		atb_hbox_boss_portrait.set_value(level.boss_portrait)
		atb_hbox_boss_count.set_value(level.bosses_count)
		atb_hbox_lvl_track_id.set_value(level.music_track_id)
		atb_hbox_lvl_music_number.set_value(level.music_game_id)
		atb_hbox_area_p.set_value(level.val_p)
		atb_hbox_area_q.set_value(level.val_q)
		atb_hbox_area_r.set_value(level.val_r)
		atb_hbox_area_s.set_value(level.val_s)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_AtbHboxVersion_value_entered() -> void:
	_set_level_config("level_version", atb_hbox_version.get_value())

func _on_AtbHboxLevelName_value_entered() -> void:
	_set_level_config("level_name", atb_hbox_level_name.get_value())

func _on_AtbHboxUsername_value_entered() -> void:
	_set_level_config("user_name", atb_hbox_username.get_value())

func _on_AtbHboxUserPortrait_value_entered() -> void:
	_set_level_config("user_icon_id", atb_hbox_user_portrait.get_value())

func _on_AtbHboxSliding_value_entered() -> void:
	_set_level_config("sliding", atb_hbox_sliding.get_value())

func _on_AtbHboxCShotOn_value_entered() -> void:
	_set_level_config("charge_shot_enable", atb_hbox_cshot_on.get_value())

func _on_AtbHboxDblDmg_value_entered() -> void:
	_set_level_config("double_damage", atb_hbox_dbl_dmg.get_value())

func _on_AtbHboxProtoStrike_value_entered() -> void:
	_set_level_config("proto_strike", atb_hbox_proto_strike.get_value())

func _on_AtbHboxDblJump_value_entered() -> void:
	_set_level_config("double_jump", atb_hbox_dbl_jump.get_value())

func _on_AtbHboxCShotType_value_entered() -> void:
	_set_level_config("charge_shot_type", atb_hbox_cshot_type.get_value())

func _on_AtbHboxBgColorID_value_entered() -> void:
	_set_level_config("default_background_color", atb_hbox_bg_color_id.get_value())

func _on_AtbHboxBossPortrait_value_entered() -> void:
	_set_level_config("boss_portrait", atb_hbox_boss_portrait.get_value())

func _on_AtbHboxBossCount_value_entered() -> void:
	_set_level_config("bosses_count", atb_hbox_boss_count.get_value())

func _on_AtbHboxLvlTrackID_value_entered() -> void:
	_set_level_config("music_track_id", atb_hbox_lvl_track_id.get_value())

func _on_AtbHboxLvlMusicNumber_value_entered() -> void:
	_set_level_config("music_game_id", atb_hbox_lvl_music_number.get_value())

func _on_AtbHboxAreaP_value_entered() -> void:
	_set_level_config("val_p", atb_hbox_area_p.get_value())

func _on_AtbHboxAreaQ_value_entered() -> void:
	_set_level_config("val_q", atb_hbox_area_q.get_value())

func _on_AtbHboxAreaR_value_entered() -> void:
	_set_level_config("val_r", atb_hbox_area_r.get_value())

func _on_AtbHboxAreaS_value_entered() -> void:
	_set_level_config("val_s", atb_hbox_area_s.get_value())

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _set_level_config(property : String, value):
	var level = get_tree().get_nodes_in_group("Level").back()
	
	if level is Level:
		level.set(property, value)

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------



