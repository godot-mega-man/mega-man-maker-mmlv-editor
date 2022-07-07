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
	if type == 5:
		object_name = _get_enemy_asset_name(id)
	# Level Objects
	if type == 6:
		object_name = _get_level_asset_name(id)
	# Pickups
	if type == 7:
		object_name = _get_pickup_asset_name(id)
	# Bosses
	if type == 8:
		object_name = _get_boss_asset_name(id)
	if type == -999:
		object_name = _get_water_or_plate(id)
	return object_name
	
	
# Gets the name for the level object of type [Playable Character]
func _get_character_asset_name (id: int) -> String:
	var level_object = ""
	if id == 0:
		level_object = "Mega Man"
	if id == 1:
		level_object = "Proto Man"
	if id == 2:
		level_object = "Bass"
	if id == 3:
		level_object = "Roll"
	return level_object
	
# Gets the name for the level object of type [Enemy]
func _get_enemy_asset_name (id: int) -> String:
	var level_object = ""
	return level_object
	
# Gets the name for the level object of type [Level Object]
func _get_level_asset_name (id: int) -> String:
	var level_object = ""
	return level_object
	
# Gets the name for the level object of type [Pickup]
func _get_pickup_asset_name (id: int) -> String:
	var level_object = ""
	if id == -999:
		level_object = "Large Health"
	if id == 1:
		level_object = "Small Health"
	if id == 2:
		level_object = "Large Weapon Ammo"
	if id == 3:
		level_object = "Small Weapon Ammo"
	if id == 4:
		level_object = "1-up"
	if id == 5:
		level_object = "E tank"
	if id == 6:
		level_object = "M tank"
	if id == 7:
		level_object = "Weapon Capsule"
	if id == 8:
		level_object = "Player Capsule"
	if id == 9:
		level_object = "Health Spawner"
	if id == 10:
		level_object = "Ammo Spawner"
	if id == 11:
		level_object = "Weapon Remover"
	if id == 12:
		level_object = "Yashichi"
	if id == 13:
		level_object = "? tank"
	return level_object
	
# Gets the name for the level object of type [Boss]
func _get_boss_asset_name (id: int) -> String:
	var level_object = ""
	#TODO: Why does editing bosses crash the game?
	#Misc
	if id == -999:
		level_object = "Legacy Boss Door (Vertical)"
	if id == 1:
		level_object = "legacy Boss Door (Horizontal)"
	if id == 33:
		level_object = "Boss Door (Vertical)"
	if id == 34:
		level_object = "Boss Door (Horizontal)"
	if id == 15:
		level_object = "Energy Element"
	if id == 16:
		level_object = "Party Ball"
	if id == 36:
		level_object = "Boss Suppressor"
		
	#MM1
	if id == 5:
		level_object = "Cut Man"
	if id == 17:
		level_object = "Ice Man"
	if id == 13:
		level_object = "Bomb Man"
	if id == 44:
		level_object = "Fire Man"
	if id == 18:
		level_object = "Time Man"
		
	#MM2
	if id == 22:
		level_object = "Bubble Man"
	if id == 42:
		level_object = "Quick Man"
	if id == 19:
		level_object = "Wood Man"
	if id == 4:
		level_object = "Crash Man"
	if id == 6:
		level_object = "Metal Man"
		
	#MM3
	if id == 10:
		level_object = "Spark Man"
	if id == 3:
		level_object = "Top Man"
	if id == 20:
		level_object = "Magnet Man"
	if id == 21:
		level_object = "Hard Man"
		
	#MM4
	if id == 24:
		level_object = "Ring Man"
	if id == 23:
		level_object = "Skull Man"
	if id == 7:
		level_object = "Toad Man"
	if id == 2:
		level_object = "Pharaoh Man"
	
	#MM5
	if id == 12:
		level_object = "Stone Man"
	if id == 25:
		level_object = "Crystal Man"
	if id == 11:
		level_object = "Napalm Man"
	if id == 26:
		level_object = "Charge Man"
		
	#MM6
	if id == 28:
		level_object = "Wind Man"
	if id == 27:
		level_object = "Flame Man"
	if id == 14:
		level_object = "Knight Man"
	if id == 43:
		level_object = "Yamato Man"
	if id == 8:
		level_object = "Plant Man"
		
	#MM7
	if id == 30:
		level_object = "Spring Man"
	if id == 46:
		level_object = "Freeze Man"
	if id == 29:
		level_object = "Shade Man"
		
	#MM8
	if id == 37:
		level_object = "Grenade Man"
	if id == 35:
		level_object = "Astro Man (MM8)"
	
	#MM9
	if id == 31:
		level_object = "Concrete Man"
	if id == 45:
		level_object = "Splash Woman"
	if id == 32:
		level_object = "Tornado Man"
		
	#MM10
	if id == 38:
		level_object = "Sheep Man"	
	if id == 39:
		level_object = "Pump Man"
	if id == 47:
		level_object = "Strike Man"
		
	#MM11
	if id == 40:
		level_object = "Blast Man"
	if id == 41:
		level_object = "Bounce Man"	
		
	#MM&B
	#if id == 5:
	#	level_object = ""
	#if id == 5:
	#	level_object = ""
	#if id == 5:
	#	level_object = ""
	#if id == 5:
	#	level_object = ""

	return level_object
	
# Gets the name for the level object of type [Water & Plate]
func _get_water_or_plate (id: int) -> String:
	var level_object = ""
	if id == 139:
		level_object = "Dr.Wily Plate"
	if id == 140:
		level_object = "Dr.Cossack Plate"
	if id == 141:
		level_object = "Mr.X Plate"
	if id == 176:
		level_object = "Dr.Light Plate"
	if id == 195:
		level_object = "Dr.Right Plate"
	if id == 196:
		level_object = "Top Shadow"
	if id == 197:
		level_object = "Bottom Shadow"
		
	if id == 178:
		level_object = "Ice Water"
	if id == 180:
		level_object = "Bubble Water"
	if id == 181:
		level_object = "Wily Water 1"
	if id == 182:
		level_object = "Gemini Water"
	if id == 183:
		level_object = "Wily Water 2"
	if id == 184:
		level_object = "Dive Water"
		
	if id == 185:
		level_object = "Toad Water"
	if id == 186:
		level_object = "Wily Water 3"
	if id == 187:
		level_object = "Wave Water"
	if id == 188:
		level_object = "Wily Water 4"
	if id == 189:
		level_object = "Blizzard Water"
	if id == 179:
		level_object = "Centaur Water"
		
	if id == 177:
		level_object = "Yamato Water"
	if id == 194:
		level_object = "Yamato Water (alt)"
	if id == 190:
		level_object = "Plant Water"
	if id == 191:
		level_object = "Wily Water 5"
	if id == 192:
		level_object = "Splash Water"
	if id == 193:
		level_object = "Wily Water 6"
		
	if id == 621:
		level_object = "Endless Water"
	if id == 622:
		level_object = "Pump Water"
	if id == 623:
		level_object = "Wily Water 7"
	if id == 624:
		level_object = "Wily Water 8"
	if id == 625:
		level_object = "Wily Water 9"
	if id == 626:
		level_object = "Endless Water 2"
		
	if id == 627:
		level_object = "Endless Water 3"
	if id == 628:
		level_object = "Challenge Water"
		
	return level_object
#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
