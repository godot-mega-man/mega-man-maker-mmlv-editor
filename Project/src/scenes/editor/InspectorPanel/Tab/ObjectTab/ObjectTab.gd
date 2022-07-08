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
onready var atb_label_locks_boss_doors = $VBox/ScrollContainer/Vbox/AtbLockBossDoors
onready var atb_label_found_the_bone = $VBox/ScrollContainer/Vbox/AtbFoundTheBone

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
	atb_label_locks_boss_doors.hide()
	atb_label_found_the_bone.hide()
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
	elif id == 17:
		level_object = "Neo Met"
	elif id == 7:
		level_object = "Sniper Joe"
	elif id == 21:
		level_object = "Telly"
	elif id == 199:
		level_object = "Telly Spawner"
	elif id == 22:
		level_object = "Telly Spawener (Solid)"
	elif id == 15:
		level_object = "Crazy Cannon"
	elif id == 16:
		level_object = "Batton"
	elif id == 18:
		level_object = "Robbit"
	elif id == 19:
		level_object = "Hot Head"
	elif id == 47:
		level_object = "Blocky"
	elif id == 50:
		level_object = "Pierobot"
	elif id == 51:
		level_object = "Croaker"
	elif id == 158:
		level_object = "Crabot"
	elif id == 63:
		level_object = "Flybot"
	elif id == 64:
		level_object = "Flybot Spawner"
	elif id == 65:
		level_object = "Fan Fiend"
	elif id == 66:
		level_object = "Shrink"
	elif id == 161:
		level_object = "Pipi"
	elif id == 162:
		level_object = "Pipi Spawner"
	elif id == 166:
		level_object = "Mole"
	elif id == 167:
		level_object = "Mole Spawner"
	elif id == 201:
		level_object = "Mole Spawner (Random)"
	elif id == 171:
		level_object = "Scworm"
	elif id == 173:
		level_object = "Atomic Chicken"
	elif id == 174:
		level_object = "Atomic Chicken Spawner"
	elif id == 53:
		level_object = "Big Fish"
	elif id == 172:
		level_object = "Sniper Armor"
	elif id == 62:
		level_object = "Hot Dog"
		atb_label_locks_boss_doors.show()
	elif id == 170:
		level_object = "Lantern Fish"
		atb_label_locks_boss_doors.show()
		
	#MM3
	elif id == 8:
		level_object = "Peterchy"
	elif id == 9:
		level_object = "Potton"
	elif id == 11:
		level_object = "Hammer Joe"
	elif id == 159:
		level_object = "Mechakkero"
	elif id == 13:
		level_object = "Pole Egg"
	elif id == 20:
		level_object = "Pole"
	elif id == 14:
		level_object = "New Shotman"
	elif id == 46:
		level_object = "Petit Snakey"
	elif id == 67:
		level_object = "Komasaburo"
	elif id == 68:
		level_object = "Hari Harry"
	elif id == 69:
		level_object = "Cannon"
	elif id == 70:
		level_object = "Walking Bomb"
	elif id == 71:
		level_object = "Gyoraibo"
	elif id == 72:
		level_object = "Yambow"
	elif id == 73:
		level_object = "Mag Fly"
	elif id == 179:
		level_object = "Electric Gabyoall"
	elif id == 108:
		level_object = "Bubukan"
	elif id == 163:
		level_object = "Nitron"
	elif id == 175:
		level_object = "Elec'n"
	elif id == 176:
		level_object = "Bomb Flier"
	elif id == 177:
		level_object = "Hologran"
	elif id == 178:
		level_object = "Giant Springer"
	elif id == 74:
		level_object = "Tama"
		atb_label_locks_boss_doors.show()
		
	#MM4
	elif id == 31:
		level_object = "Skeleton Joe"
		atb_label_found_the_bone.show()
	elif id == 34:
		level_object = "Togehero"
	elif id == 30:
		level_object = "Shield Attacker"
	elif id == 32:
		level_object = "Super Ball Machine Jr."
	elif id == 33:
		level_object = "Skullmet"
	elif id == 35:
		level_object = "Taketento"
	elif id == 36:
		level_object = "Gachappon"
	elif id == 75:
		level_object = "Minoan"
	elif id == 76:
		level_object = "Wall Blaster"
	elif id == 77:
		level_object = "Totem Polen"
	elif id == 78:
		level_object = "Pakatto 24"
	elif id == 79:
		level_object = "Docron"
		atb_label_found_the_bone.show()
	elif id == 80:
		level_object = "Docron Spawner"
		atb_label_found_the_bone.show()
	elif id == 81:
		level_object = "Mummira"
	elif id == 82:
		level_object = "Garyoby"
	elif id == 164:
		level_object = "Ladder Press"
	elif id == 192:
		level_object = "Helipon"
	elif id == 193:
		level_object = "Ring Ring"
	elif id == 194:
		level_object = "Battan"
	elif id == 195:
		level_object = "Sea Mine"
	elif id == 196:
		level_object = "Sea Mine Spawner"
	elif id == 197:
		level_object = "Ratton"
	elif id == 83:
		level_object = "Whopper"
		atb_label_locks_boss_doors.show()
		
	#MM5
	elif id == 39:
		level_object = "Train Met"
	elif id == 23:
		level_object = "Crystal Joe"
	elif id == 29:
		level_object = "Shield Attacker (MM5)"
	elif id == 27:
		level_object = "Pukapelly"
	elif id == 28:
		level_object = "Lyrics"
	elif id == 37:
		level_object = "Kouker"
	elif id == 38:
		level_object = "Bitter"
	elif id == 55:
		level_object = "Power Muscler"
	elif id == 84:
		level_object = "Bomb Thrown"
	elif id == 85:
		level_object = "Metall Cannon"
	elif id == 86:
		level_object = "Subeil"
	elif id == 87:
		level_object = "Giree"
	elif id == 88:
		level_object = "Giree Spawner"
	elif id == 89:
		level_object = "Tondeall"
	elif id == 90:
		level_object = "Pukapucker"
	elif id == 91:
		level_object = "Bounder"
	elif id == 180:
		level_object = "Sumatran"
	elif id == 181:
		level_object = "Bombier"
	elif id == 186:
		level_object = "Cocco"
	elif id == 187:
		level_object = "Jet Bomb (Horizontal)"
	elif id == 188:
		level_object = "Jet Bomb (Vertical)"
	elif id == 189:
		level_object = "V"
		
	#MM6
	elif id == 6:
		level_object = "Colton"
	elif id == 10:
		level_object = "Shield Attacker (MM6)"
	elif id == 42:
		level_object = "Fire Telly"
	elif id == 40:
		level_object = "Au Au"
	elif id == 41:
		level_object = "Ben K"
	elif id == 43:
		level_object = "Cannopeller"
	elif id == 44:
		level_object = "Twin Roader"
	elif id == 54:
		level_object = "Brain Break"
	elif id == 92:
		level_object = "Katonbyon"
	elif id == 93:
		level_object = "Curlinger"
	elif id == 94:
		level_object = "SRU-21/P"
	elif id == 95:
		level_object = "Gabgyo"
	elif id == 96:
		level_object = "Pooker"
	elif id == 97:
		level_object = "Cyber Gabyoall"
	elif id == 99:
		level_object = "Yaffu"
	elif id == 182:
		level_object = "Hotchkiss'n"
	elif id == 183:
		level_object = "Molier"
	elif id == 184:
		level_object = "Submarine Flier"
	elif id == 185:
		level_object = "Propeller Eye"
	elif id == 190:
		level_object = "Skull Walker"
		atb_label_found_the_bone.show()
	elif id == 191:
		level_object = "Brown"
	elif id == 98:
		level_object = "Squidon"
		atb_label_locks_boss_doors.show()
	
	#MM7
	elif id == 100:
		level_object = "Tripropellan"
	elif id == 101:
		level_object = "Icicle Teck"
	elif id == 102:
		level_object = "Trio The Wheel"
	elif id == 103:
		level_object = "Baccone"
	elif id == 104:
		level_object = "Tom Daddy"
	elif id == 105:
		level_object = "Frisk Cannon"
	elif id == 106:
		level_object = "Gockroach S"
	elif id == 107:
		level_object = "Gockroach S Nest"
	elif id == 109:
		level_object = "Turbo Roader"
	elif id == 110:
		level_object = "Kaminari Kogoro"
	elif id == 111:
		level_object = "Cyorown"
	elif id == 112:
		level_object = "Gobots"
	elif id == 113:
		level_object = "Tsuranattori"
		
	#MM8
	elif id == 125:
		level_object = "Shell'n"
	elif id == 126:
		level_object = "Bunby Tank DX"
	elif id == 127:
		level_object = "Joe Classic"
	elif id == 128:
		level_object = "Surumaker"
	elif id == 129:
		level_object = "Hannya Attacker"
	elif id == 130:
		level_object = "Crunchran"
	elif id == 134:
		level_object = "Fire Met"
	elif id == 135:
		level_object = "Fire Met (Spawner)"
	elif id == 137:
		level_object = "Wall Teck"
	elif id == 131:
		level_object = "Rabbiton"
	elif id == 132:
		level_object = "PenPen EV"
	elif id == 133:
		level_object = "Big Telly"
	
	#MM9
	elif id == 24:
		level_object = "Petit Devil"
	elif id == 26:
		level_object = "CariCarry"
	elif id == 115:
		level_object = "Bombomboy"
	elif id == 114:
		level_object = "Flower Presenter"
	elif id == 116:
		level_object = "Fire Totem"
	elif id == 117:
		level_object = "Okosutobon"
	elif id == 118:
		level_object = "Dairn"
	elif id == 119:
		level_object = "Hoo Hoo"
	elif id == 120:
		level_object = "Hoo Hoo (Spawner)"
	elif id == 121:
		level_object = "Kakinbarank"
	elif id == 122:
		level_object = "Adamski"
	elif id == 123:
		level_object = "Nombrellan"
	elif id == 136:
		level_object = "Nombrellan (Spawner)"
	elif id == 124:
		level_object = "Sakrets"
	elif id == 198:
		level_object = "Bunby Catcher"		
		
	#MM10
	elif id == 138:
		level_object = "Cargou Q"
	elif id == 139:
		level_object = "Kaona Geeno"
	elif id == 140:
		level_object = "Pointan"
	elif id == 141:
		level_object = "Sola O"
	elif id == 142:
		level_object = "Oshitsu Osarettsu"
	elif id == 143:
		level_object = "Numetall"
	elif id == 144:
		level_object = "Merserker"
	elif id == 145:
		level_object = "Bari III (Head)"
	elif id == 146:
		level_object = "Bari III (Body)"
	elif id == 147:
		level_object = "Mecha Pitchan"
	elif id == 148:
		level_object = "Searchy"
	elif id == 200:
		level_object = "Searchy (Spawner)"
	elif id == 160:
		level_object = "Returning Machine Gun Joe"
	elif id == 165:
		level_object = "Neo Heli Metall"
	elif id == 168:
		level_object = "Momole"
	elif id == 169:
		level_object = "Momole (Spawner)"
	elif id == 202:
		level_object = "Momole (Random)"
		
	#MM11
	elif id == 149:
		level_object = "Electro Guard"
	elif id == 150:
		level_object = "Electritri"
	elif id == 152:
		level_object = "Electritri (Spawner)"
	elif id == 151:
		level_object = "Electritri (Spawner Solid)"
	elif id == 153:
		level_object = "Pipetto"
	elif id == 154:
		level_object = "Anti-Eddie"
	elif id == 155:
		level_object = "Air Stone/Fire/Nut"
	elif id == 156:
		level_object = "Mash Burner"
	elif id == 157:
		level_object = "Crunch Don"

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
