# ObjectTab
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

onready var atb_hbox_obj_vec_x = $VBox/ScrollContainer/Vbox/AtbHboxObjVecX
onready var atb_hbox_obj_vec_y = $VBox/ScrollContainer/Vbox/AtbHboxObjVecY
onready var atb_hbox_obj_type = $VBox/ScrollContainer/Vbox/AtbHboxObjType
onready var atb_hbox_obj_id = $VBox/ScrollContainer/Vbox/AtbHboxObjID
onready var atb_hbox_obj_appearance = $VBox/ScrollContainer/Vbox/AtbHboxObjAppearance
onready var atb_hbox_obj_direction = $VBox/ScrollContainer/Vbox/AtbHboxObjDirection
onready var atb_hbox_obj_timer = $VBox/ScrollContainer/Vbox/AtbHboxObjTimer
onready var atb_hbox_obj_tex_h = $VBox/ScrollContainer/Vbox/AtbHboxObjTexH
onready var atb_hbox_obj_tex_v = $VBox/ScrollContainer/Vbox/AtbHboxObjTexV
onready var atb_hbox_obj_dest_x = $VBox/ScrollContainer/Vbox/AtbHboxObjDestX
onready var atb_hbox_obj_dest_y = $VBox/ScrollContainer/Vbox/AtbHboxObjDestY
onready var atb_hbox_obj_option = $VBox/ScrollContainer/Vbox/AtbHboxObjOption
onready var atb_label_level_object = $VBox/ScrollContainer/Vbox/AtbLabelLevelObject

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_connect_SelectedObjects()

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

func _on_SelectedObjects_selected():
	_update_properties_from_selected_objects()

func _on_AtbHboxObjVecX_value_entered() -> void:
	_set_selected_objects("obj_vector_x", atb_hbox_obj_vec_x.get_value())

func _on_AtbHboxObjVecY_value_entered() -> void:
	_set_selected_objects("obj_vector_y", atb_hbox_obj_vec_y.get_value())

func _on_AtbHboxObjType_value_entered() -> void:
	_set_selected_objects("obj_type", atb_hbox_obj_type.get_value())

func _on_AtbHboxObjID_value_entered() -> void:
	_set_selected_objects("obj_id", atb_hbox_obj_id.get_value())

func _on_AtbHboxObjAppearance_value_entered() -> void:
	_set_selected_objects("obj_appearance", atb_hbox_obj_appearance.get_value())

func _on_AtbHboxObjDirection_value_entered() -> void:
	_set_selected_objects("obj_direction", atb_hbox_obj_direction.get_value())

func _on_AtbHboxObjTimer_value_entered() -> void:
	_set_selected_objects("obj_timer", atb_hbox_obj_timer.get_value())

func _on_AtbHboxObjTexH_value_entered() -> void:
	_set_selected_objects("obj_tex_h_offset", atb_hbox_obj_tex_h.get_value())

func _on_AtbHboxObjTexV_value_entered() -> void:
	_set_selected_objects("obj_tex_v_offset", atb_hbox_obj_tex_v.get_value())

func _on_AtbHboxObjDestX_value_entered() -> void:
	_set_selected_objects("obj_destination_x", atb_hbox_obj_dest_x.get_value())

func _on_AtbHboxObjDestY_value_entered() -> void:
	_set_selected_objects("obj_destination_y", atb_hbox_obj_dest_y.get_value())

func _on_AtbHboxObjOption_value_entered() -> void:
	_set_selected_objects("obj_option", atb_hbox_obj_option.get_value())

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_properties_from_selected_objects():
	clear_all_properties()
	
	for i in SelectedObjects.selected_objects:
		if i is PreviewGameObject:
			atb_hbox_obj_vec_x.set_value(i.obj_vector_x)
			atb_hbox_obj_vec_y.set_value(i.obj_vector_y)
			atb_hbox_obj_type.set_value(i.obj_type)
			atb_hbox_obj_id.set_value(i.obj_id)
			atb_hbox_obj_appearance.set_value(i.obj_appearance)
			atb_hbox_obj_direction.set_value(i.obj_direction)
			atb_hbox_obj_timer.set_value(i.obj_timer)
			atb_hbox_obj_tex_h.set_value(i.obj_tex_h_offset)
			atb_hbox_obj_tex_v.set_value(i.obj_tex_v_offset)
			atb_hbox_obj_dest_x.set_value(i.obj_destination_x)
			atb_hbox_obj_dest_y.set_value(i.obj_destination_y)
			atb_hbox_obj_option.set_value(i.obj_option)
			atb_label_level_object.text = _get_level_object_name(i.obj_type, i.obj_id)

func _set_selected_objects(property : String, value):
	for i in SelectedObjects.selected_objects:
		if i is PreviewGameObject:
			i.set(property, value)

func _connect_SelectedObjects():
	SelectedObjects.connect("selected", self, "_on_SelectedObjects_selected")

func _get_level_object_name(type: int ,id: int) -> String: 
	var object_name = ""
	# Playable Characters
	if type == 4:
		object_name = _get_character_asset_name(id)
	# Enemies
	elif type == 5:
		object_name = _get_enemy_asset_name(id)
	# Level Objects
	elif type == 6:
		object_name = _get_level_asset_name(id)
	# Pickups
	elif type == 7:
		object_name = _get_pickup_asset_name(id)
	# Bosses
	elif type == 8:
		object_name = _get_boss_asset_name(id)
	elif type == -999:
		object_name = _get_water_or_plate(id)
	return object_name
	
	
# Gets the name for the level object of type [Playable Character]
func _get_character_asset_name (id: int) -> String:
	var level_object = ""
	if id == -999:
		level_object = "Mega Man"
	elif id == 0:
		level_object = "Mega Man"
	elif id == 1:
		level_object = "Proto Man"
	elif id == 2:
		level_object = "Bass"
	elif id == 3:
		level_object = "Roll"
	return level_object
	
# Gets the name for the level object of type [Enemy]
func _get_enemy_asset_name (id: int) -> String:
	var level_object = ""
	
	#MM1
	if id == -999:
		level_object = "Met"
	elif id == 0:
		level_object = "Met"
	elif id == 1:
		level_object = "Octopus Battery"
	elif id == 2:
		level_object = "Beak"
	elif id == 3:
		level_object = "Picket Man"
	elif id == 4:
		level_object = "Screw Bomber"
	elif id == 5:
		level_object = "Big Eye"
	elif id == 48:
		level_object = "Spine"
	elif id == 49:
		level_object = "Crazy Razy"
	elif id == 52:
		level_object = "Seeker"
	elif id == 56:
		level_object = "Killer Bullet"
	elif id == 57:
		level_object = "Killer Bullet Spawner"
	elif id == 58:
		level_object = "Tackle Fire"
	elif id == 59:
		level_object = "Flying Shell"
	elif id == 60:
		level_object = "Flying Shell Spawner"
	elif id == 45:
		level_object = "Footholder"
		
	#MM2
	elif id == 16:
		level_object = "Legacy Water"
	elif id == 17:
		level_object = "Count Bomb (Vertical)"
	elif id == 18:
		level_object = "Count Bomb (Horizontal)"
	elif id == 19:
		level_object = "Legacy Large Health"
	elif id == 20:
		level_object = "Legacy Small Health"
	elif id == 21:
		level_object = "Legacy Large Weapon Ammo"
	elif id == 22:
		level_object = "Legacy Small Weapon Ammo"
	elif id == 23:
		level_object = "Legacy 1-up"
	elif id == 24:
		level_object = "Legacy E Tank"
	elif id == 25:
		level_object = "Legacy M Tank"
	elif id == 26:
		level_object = "Legacy Teleporter"
	elif id == 27:
		level_object = "Weapon Block 2x2"
	elif id == 28:
		level_object = "Weapon Block 1x2"
	elif id == 29:
		level_object = "Flame Pillar"
	elif id == 30:
		level_object = "Press"
	elif id == 31:
		level_object = "Crash Lelift"
	elif id == 32:
		level_object = "Key"
	elif id == 33:
		level_object = "Key Door (Vertical)"
	elif id == 34:
		level_object = "Legacy Wannan"
	elif id == 35:
		level_object = "Magnet"
	elif id == 36:
		level_object = "Ring Platform"
	elif id == 37:
		level_object = "Sand"
	elif id == 38:
		level_object = "Rolling Drill"
	elif id == 39:
		level_object = "Teckyun"
	elif id == 40:
		level_object = "Coil Platform"
	elif id == 41:
		level_object = "Rolling Drill Spawner"
	elif id == 42:
		level_object = "Oil"
	elif id == 43:
		level_object = "Fan"
	elif id == 44:
		level_object = "Floor Light"
	elif id == 45:
		level_object = "Cracked Block"
	elif id == 46:
		level_object = "Checkpoint"
	elif id == 47:
		level_object = "Jet Platform"
	elif id == 48:
		level_object = "Punch Block"
	elif id == 49:
		level_object = "Push Block"
	elif id == 50:
		level_object = "Force Beam"
	elif id == 51:
		level_object = "Red Force Beam"
	elif id == 52:
		level_object = "Green Force Beam"
	elif id == 53:
		level_object = "Rain"
	elif id == 54:
		level_object = "Illusian"
	elif id == 55:
		level_object = "Illusian Block"
	elif id == 56:
		level_object = "Reflecting Yoku Block"
	elif id == 57:
		level_object = "Bokozurah"
	elif id == 58:
		level_object = "Bokozurah Block"
	elif id == 59:
		level_object = "Astro Button"
	elif id == 60:
		level_object = "Astro Gate"
	elif id == 61:
		level_object = "Astro Reset Button"
	elif id == 62:
		level_object = "Thunder Claw Pole"
	elif id == 63:
		level_object = "Legacy Boss Suppressor"
	elif id == 64:
		level_object = "TNT Block"
	elif id == 65:
		level_object = "Teleporter"
	elif id == 66:
		level_object = "Magma Beam Generator"
	elif id == 67:
		level_object = "Rotating Platform"
	elif id == 68:
		level_object = "Wannan"
	elif id == 69:
		level_object = "Sheep Block"
	elif id == 70:
		level_object = "Sheep Spike Block"
	elif id == 71:
		level_object = "Chill Block"
	elif id == 72:
		level_object = "Moving Elevator"
	elif id == 73:
		level_object = "Conveyor"
	elif id == 74:
		level_object = "Moving Cog"
	elif id == 75:
		level_object = "M Tank that Crashes the game"
	elif id == 76:
		level_object = "Weapon Block 2x1"
	elif id == 77:
		level_object = "Acid Solution"
	elif id == 78:
		level_object = "Spinning Wheel"
	elif id == 79:
		level_object = "Fire Wall"
	elif id == 80:
		level_object = "Key Door (Horizontal)"
	elif id == 81:
		level_object = "Moving Elevator Vertical Stop"
	elif id == 82:
		level_object = "On/Off Switch"
	elif id == 83:
		level_object = "On/Off Block (Blue)"
	elif id == 84:
		level_object = "On/Off Block (Red)"
	elif id == 85:
		level_object = "On/Off Spike (Blue)"
	elif id == 86:
		level_object = "On/Off Spike (Red)"
	elif id == 87:
		level_object = "On/Off Ladder (Blue)"
	elif id == 88:
		level_object = "On/Off Ladder (Red)"
	elif id == 89:
		level_object = "Splash Platform"
	elif id == 90:
		level_object = "Bounce Ball"
	elif id == 91:
		level_object = "On/Off Switch Timer"
	elif id == 92:
		level_object = "Plantform"
	elif id == 93:
		level_object = "Super Arm Block"
	elif id == 94:
		level_object = "Acid Drop"
	elif id == 95:
		level_object = "Needle Press (Vertical)"
	elif id == 96:
		level_object = "Needle Press (Horizontal)"
	elif id == 97:
		level_object = "Top Platform Spawner"
	elif id == 98:
		level_object = "Top Platform"
	elif id == 99:
		level_object = "Music Changer"
	elif id == 100:
		level_object = "Spike Platform (Down)"
	elif id == 101:
		level_object = "Fire Wave Spawner (Horizontal)"
	elif id == 102:
		level_object = "Fire Wave Spawner (Vertical)"
	elif id == 103:
		level_object = "Fire Wave Redirector"
	elif id == 104:
		level_object = "Fire Wave Redirector (No-Clip)"
	elif id == 105:
		level_object = "Steam (Vertical)"
	elif id == 106:
		level_object = "Steam (Horizontal)"
	elif id == 107:
		level_object = "Concrete Platform"
	elif id == 108:
		level_object = "Soccer Ball"
	elif id == 109:
		level_object = "Fork Block"
	elif id == 110:
		level_object = "Hornet Roller"
	elif id == 111:
		level_object = "Fire Wave Shaft (Horizontal)"
	elif id == 112:
		level_object = "Fire Wave Shaft (Vertical)"
	elif id == 113:
		level_object = "Jump Through Platform"
	elif id == 114:
		level_object = "spike platform (Up)"
	elif id == 115:
		level_object = "Fuse Rail"
	elif id == 116:
		level_object = "Fuse Crosser"
	elif id == 117:
		level_object = "Fuse Laser Spawner"
	elif id == 118:
		level_object = "Fuse Xtender"
	elif id == 119:
		level_object = "Ice Wall (Horizontal)"
	elif id == 120:
		level_object = "Ice Wall (Vertical)"
	elif id == 121:
		level_object = "Fire Wall Stop"
	elif id == 122:
		level_object = "Fuse Crawler Exit"
	elif id == 123:
		level_object = "Fire Wave Spawner Screen (Horizontal)"
	elif id == 124:
		level_object = "Fire Wave Spawner Screen (Vertical)"
	elif id == 125:
		level_object = "Fuse Crawler"
	elif id == 126:
		level_object = "Acid Drop"
	elif id == 127:
		level_object = "Magnetic Ceiling"
	elif id == 128:
		level_object = "Magnetic Ceiling Conveyor"
	elif id == 129:
		level_object = "Magnetic Ceiling On/Off (Red)"
	elif id == 130:
		level_object = "Magnetic Ceiling On/Off (Red)"
	
	return level_object
	
# Gets the name for the level object of type [Level Object]
func _get_level_asset_name (id: int) -> String:
	var level_object = ""
	if id == -999:
		level_object = "Lift Platform"
	elif id == 0:
		level_object = "Lift Platform"
	elif id == 1:
		level_object = "Drop Platform"
	elif id == 2:
		level_object = "Legacy Conveyor"
	elif id == 3:
		level_object = "Fire Beam"
	elif id == 4:
		level_object = "Elec Beam"
	elif id == 5:
		level_object = "Yoku Block"
	elif id == 6:
		level_object = "Legacy Force Beam"
	elif id == 7:
		level_object = "Legacy Red Force Beam"
	elif id == 8:
		level_object = "Legacy Green Force Beam"
	elif id == 9:
		level_object = "Dust Block"
	elif id == 10:
		level_object = "Cossack Block"
	elif id == 11:
		level_object = "Falling Platform"
	elif id == 12:
		level_object = "Legacy Rotating Platform"
	elif id == 13:
		level_object = "Spring"
	elif id == 14:
		level_object = "Flip Platform"
	elif id == 15:
		level_object = "Legacy Checkpoint"
	elif id == 16:
		level_object = "Legacy Water"
	elif id == 17:
		level_object = "Count Bomb (Vertical)"
	elif id == 18:
		level_object = "Count Bomb (Horizontal)"
	elif id == 19:
		level_object = "Legacy Large Health"
	elif id == 20:
		level_object = "Legacy Small Health"
	elif id == 21:
		level_object = "Legacy Large Weapon Ammo"
	elif id == 22:
		level_object = "Legacy Small Weapon Ammo"
	elif id == 23:
		level_object = "Legacy 1-up"
	elif id == 24:
		level_object = "Legacy E Tank"
	elif id == 25:
		level_object = "Legacy M Tank"
	elif id == 26:
		level_object = "Legacy Teleporter"
	elif id == 27:
		level_object = "Weapon Block 2x2"
	elif id == 28:
		level_object = "Weapon Block 1x2"
	elif id == 29:
		level_object = "Flame Pillar"
	elif id == 30:
		level_object = "Press"
	elif id == 31:
		level_object = "Crash Lift"
	elif id == 32:
		level_object = "Key"
	elif id == 33:
		level_object = "Key Door (Vertical)"
	elif id == 34:
		level_object = "Legacy Wannan"
	elif id == 35:
		level_object = "Magnet"
	elif id == 36:
		level_object = "Ring Platform"
	elif id == 37:
		level_object = "Sand"
	elif id == 38:
		level_object = "Rolling Drill"
	elif id == 39:
		level_object = "Teckyun"
	elif id == 40:
		level_object = "Coil Platform"
	elif id == 41:
		level_object = "Rolling Drill Spawner"
	elif id == 42:
		level_object = "Oil"
	elif id == 43:
		level_object = "Fan"
	elif id == 44:
		level_object = "Floor Light"
	elif id == 45:
		level_object = "Cracked Block"
	elif id == 46:
		level_object = "Checkpoint"
	elif id == 47:
		level_object = "Jet Platform"
	elif id == 48:
		level_object = "Punch Block"
	elif id == 49:
		level_object = "Push Block"
	elif id == 50:
		level_object = "Force Beam"
	elif id == 51:
		level_object = "Red Force Beam"
	elif id == 52:
		level_object = "Green Force Beam"
	elif id == 53:
		level_object = "Rain"
	elif id == 54:
		level_object = "Illusian"
	elif id == 55:
		level_object = "Illusian Block"
	elif id == 56:
		level_object = "Reflecting Yoku Block"
	elif id == 57:
		level_object = "Bokozurah"
	elif id == 58:
		level_object = "Bokozurah Block"
	elif id == 59:
		level_object = "Astro Button"
	elif id == 60:
		level_object = "Astro Gate"
	elif id == 61:
		level_object = "Astro Reset Button"
	elif id == 62:
		level_object = "Thunder Claw Pole"
	elif id == 63:
		level_object = "Legacy Boss Suppressor"
	elif id == 64:
		level_object = "TNT Block"
	elif id == 65:
		level_object = "Teleporter"
	elif id == 66:
		level_object = "Magma Beam Generator"
	elif id == 67:
		level_object = "Rotating Platform"
	elif id == 68:
		level_object = "Wannan"
	elif id == 69:
		level_object = "Sheep Block"
	elif id == 70:
		level_object = "Sheep Spike Block"
	elif id == 71:
		level_object = "Chill Block"
	elif id == 72:
		level_object = "Moving Elevator"
	elif id == 73:
		level_object = "Conveyor"
	elif id == 74:
		level_object = "Moving Cog"
	elif id == 75:
		level_object = "M Tank that Crashes the game"
	elif id == 76:
		level_object = "Weapon Block 2x1"
	elif id == 77:
		level_object = "Acid Solution"
	elif id == 78:
		level_object = "Spinning Wheel"
	elif id == 79:
		level_object = "Fire Wall"
	elif id == 80:
		level_object = "Key Door (Horizontal)"
	elif id == 81:
		level_object = "Moving Elevator Vertical Stop"
	elif id == 82:
		level_object = "On/Off Switch"
	elif id == 83:
		level_object = "On/Off Block (Blue)"
	elif id == 84:
		level_object = "On/Off Block (Red)"
	elif id == 85:
		level_object = "On/Off Spike (Blue)"
	elif id == 86:
		level_object = "On/Off Spike (Red)"
	elif id == 87:
		level_object = "On/Off Ladder (Blue)"
	elif id == 88:
		level_object = "On/Off Ladder (Red)"
	elif id == 89:
		level_object = "Splash Platform"
	elif id == 90:
		level_object = "Bounce Ball"
	elif id == 91:
		level_object = "On/Off Switch Timer"
	elif id == 92:
		level_object = "Plantform"
	elif id == 93:
		level_object = "Super Arm Block"
	elif id == 94:
		level_object = "Acid Drop"
	elif id == 95:
		level_object = "Needle Press (Vertical)"
	elif id == 96:
		level_object = "Needle Press (Horizontal)"
	elif id == 97:
		level_object = "Top Platform Spawner"
	elif id == 98:
		level_object = "Top Platform"
	elif id == 99:
		level_object = "Music Changer"
	elif id == 100:
		level_object = "Spike Platform (Down)"
	elif id == 101:
		level_object = "Fire Wave Spawner (Horizontal)"
	elif id == 102:
		level_object = "Fire Wave Spawner (Vertical)"
	elif id == 103:
		level_object = "Fire Wave Redirector"
	elif id == 104:
		level_object = "Fire Wave Redirector (No-Clip)"
	elif id == 105:
		level_object = "Steam (Vertical)"
	elif id == 106:
		level_object = "Steam (Horizontal)"
	elif id == 107:
		level_object = "Concrete Platform"
	elif id == 108:
		level_object = "Soccer Ball"
	elif id == 109:
		level_object = "Fork Block"
	elif id == 110:
		level_object = "Hornet Roller"
	elif id == 111:
		level_object = "Fire Wave Shaft (Horizontal)"
	elif id == 112:
		level_object = "Fire Wave Shaft (Vertical)"
	elif id == 113:
		level_object = "Jump Through Platform"
	elif id == 114:
		level_object = "spike platform (Up)"
	elif id == 115:
		level_object = "Fuse Rail"
	elif id == 116:
		level_object = "Fuse Crosser"
	elif id == 117:
		level_object = "Fuse Laser Spawner"
	elif id == 118:
		level_object = "Fuse Xtender"
	elif id == 119:
		level_object = "Ice Wall (Horizontal)"
	elif id == 120:
		level_object = "Ice Wall (Vertical)"
	elif id == 121:
		level_object = "Fire Wall Stop"
	elif id == 122:
		level_object = "Fuse Crawler Exit"
	elif id == 123:
		level_object = "Fire Wave Spawner Screen (Horizontal)"
	elif id == 124:
		level_object = "Fire Wave Spawner Screen (Vertical)"
	elif id == 125:
		level_object = "Fuse Crawler"
	elif id == 126:
		level_object = "Acid Drop"
	elif id == 127:
		level_object = "Magnetic Ceiling"
	elif id == 128:
		level_object = "Magnetic Ceiling Conveyor"
	elif id == 129:
		level_object = "Magnetic Ceiling On/Off (Red)"
	elif id == 130:
		level_object = "Magnetic Ceiling On/Off (Red)"
	
	return level_object
	
# Gets the name for the level object of type [Pickup]
func _get_pickup_asset_name (id: int) -> String:
	var level_object = ""
	if id == -999:
		level_object = "Large Health"
	elif id == 1:
		level_object = "Small Health"
	elif id == 2:
		level_object = "Large Weapon Ammo"
	elif id == 3:
		level_object = "Small Weapon Ammo"
	elif id == 4:
		level_object = "1-up"
	elif id == 5:
		level_object = "E tank"
	elif id == 6:
		level_object = "M tank"
	elif id == 7:
		level_object = "Weapon Capsule"
	elif id == 8:
		level_object = "Player Capsule"
	elif id == 9:
		level_object = "Health Spawner"
	elif id == 10:
		level_object = "Ammo Spawner"
	elif id == 11:
		level_object = "Weapon Remover"
	elif id == 12:
		level_object = "Yashichi"
	elif id == 13:
		level_object = "? tank"
	return level_object
	
# Gets the name for the level object of type [Boss]
func _get_boss_asset_name (id: int) -> String:
	var level_object = ""
	#TODO: Why does editing bosses crash the game?
	#Misc
	if id == -999:
		level_object = "Legacy Boss Door (Vertical)"
	elif id == 1:
		level_object = "legacy Boss Door (Horizontal)"
	elif id == 33:
		level_object = "Boss Door (Vertical)"
	elif id == 34:
		level_object = "Boss Door (Horizontal)"
	elif id == 15:
		level_object = "Energy Element"
	elif id == 16:
		level_object = "Party Ball"
	elif id == 36:
		level_object = "Boss Suppressor"
		
	#MM1
	elif id == 5:
		level_object = "Cut Man"
	elif id == 17:
		level_object = "Ice Man"
	elif id == 13:
		level_object = "Bomb Man"
	elif id == 44:
		level_object = "Fire Man"
	elif id == 18:
		level_object = "Time Man"
		
	#MM2
	elif id == 22:
		level_object = "Bubble Man"
	elif id == 42:
		level_object = "Quick Man"
	elif id == 19:
		level_object = "Wood Man"
	elif id == 4:
		level_object = "Crash Man"
	elif id == 6:
		level_object = "Metal Man"
		
	#MM3
	elif id == 10:
		level_object = "Spark Man"
	elif id == 3:
		level_object = "Top Man"
	elif id == 20:
		level_object = "Magnet Man"
	elif id == 21:
		level_object = "Hard Man"
		
	#MM4
	elif id == 24:
		level_object = "Ring Man"
	elif id == 23:
		level_object = "Skull Man"
	elif id == 7:
		level_object = "Toad Man"
	elif id == 2:
		level_object = "Pharaoh Man"
	
	#MM5
	elif id == 12:
		level_object = "Stone Man"
	elif id == 25:
		level_object = "Crystal Man"
	elif id == 11:
		level_object = "Napalm Man"
	elif id == 26:
		level_object = "Charge Man"
		
	#MM6
	elif id == 28:
		level_object = "Wind Man"
	elif id == 27:
		level_object = "Flame Man"
	elif id == 14:
		level_object = "Knight Man"
	elif id == 43:
		level_object = "Yamato Man"
	elif id == 8:
		level_object = "Plant Man"
		
	#MM7
	elif id == 30:
		level_object = "Spring Man"
	elif id == 46:
		level_object = "Freeze Man"
	elif id == 29:
		level_object = "Shade Man"
		
	#MM8
	elif id == 37:
		level_object = "Grenade Man"
	elif id == 35:
		level_object = "Astro Man (MM8)"
	
	#MM9
	elif id == 31:
		level_object = "Concrete Man"
	elif id == 45:
		level_object = "Splash Woman"
	elif id == 32:
		level_object = "Tornado Man"
		
	#MM10
	elif id == 38:
		level_object = "Sheep Man"	
	elif id == 39:
		level_object = "Pump Man"
	elif id == 47:
		level_object = "Strike Man"
		
	#MM11
	elif id == 40:
		level_object = "Blast Man"
	elif id == 41:
		level_object = "Bounce Man"	
		
	#MM&B
	#elif id == 5:
	#	level_object = ""
	#elif id == 5:
	#	level_object = ""
	#elif id == 5:
	#	level_object = ""
	#elif id == 5:
	#	level_object = ""

	return level_object
	
# Gets the name for the level object of type [Water & Plate]
func _get_water_or_plate (id: int) -> String:
	var level_object = ""
	if id == 139:
		level_object = "Dr.Wily Plate"
	elif id == 140:
		level_object = "Dr.Cossack Plate"
	elif id == 141:
		level_object = "Mr.X Plate"
	elif id == 176:
		level_object = "Dr.Light Plate"
	elif id == 195:
		level_object = "Dr.Right Plate"
	elif id == 196:
		level_object = "Top Shadow"
	elif id == 197:
		level_object = "Bottom Shadow"
		
	elif id == 178:
		level_object = "Ice Water"
	elif id == 180:
		level_object = "Bubble Water"
	elif id == 181:
		level_object = "Wily Water 1"
	elif id == 182:
		level_object = "Gemini Water"
	elif id == 183:
		level_object = "Wily Water 2"
	elif id == 184:
		level_object = "Dive Water"
		
	elif id == 185:
		level_object = "Toad Water"
	elif id == 186:
		level_object = "Wily Water 3"
	elif id == 187:
		level_object = "Wave Water"
	elif id == 188:
		level_object = "Wily Water 4"
	elif id == 189:
		level_object = "Blizzard Water"
	elif id == 179:
		level_object = "Centaur Water"
		
	elif id == 177:
		level_object = "Yamato Water"
	elif id == 194:
		level_object = "Yamato Water (alt)"
	elif id == 190:
		level_object = "Plant Water"
	elif id == 191:
		level_object = "Wily Water 5"
	elif id == 192:
		level_object = "Splash Water"
	elif id == 193:
		level_object = "Wily Water 6"
		
	elif id == 621:
		level_object = "Endless Water"
	elif id == 622:
		level_object = "Pump Water"
	elif id == 623:
		level_object = "Wily Water 7"
	elif id == 624:
		level_object = "Wily Water 8"
	elif id == 625:
		level_object = "Wily Water 9"
	elif id == 626:
		level_object = "Endless Water 2"
		
	elif id == 627:
		level_object = "Endless Water 3"
	elif id == 628:
		level_object = "Challenge Water"
		
	return level_object
#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
