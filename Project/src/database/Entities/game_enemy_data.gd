# Script_Name_Here
# Written by: JDE

extends Reference

class_name GameEnemyData

"""
	a list of the game enemies by their ID. (sorted by game)
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

const ENEMY_COUNT = 202


const ENEMY_DATA = {
	#MM1
	-999:"Met",
	0: "Met",
	1: "Octopus Battery",
	2: "Beak",
	3: "Picket Man",
	4: "Screw Bomber",
	5: "Big Eye",
	48: "Spine",
	49: "Crazy Razy",
	52: "Seeker",
	56: "Killer Bullet",
	57: "Killer Bullet Spawner",
	58: "Tackle Fire",
	59: "Flying Shell",
	60: "Flying Shell Spawner",
	45: "Footholder",
		
	#MM2
	17: "Neo Met",
	7: "Sniper Joe",
	21: "Telly",
	199: "Telly Spawner",
	22: "Telly Spawener (Solid)",
	15: "Crazy Cannon",
	16: "Batton",
	18: "Robbit",
	19: "Hot Head",
	47: "Blocky",
	50: "Pierobot",
	51: "Croaker",
	158: "Crabot",
	63: "Flybot",
	64: "Flybot Spawner",
	65: "Fan Fiend",
	66: "Shrink",
	161: "Pipi",
	162: "Pipi Spawner",
	166: "Mole",
	167: "Mole Spawner",
	201: "Mole Spawner (Random)",
	171: "Scworm",
	173: "Atomic Chicken",
	174: "Atomic Chicken Spawner",
	53: "Big Fish",
	172: "Sniper Armor",
	62: "Hot Dog",
	170:"Lantern Fish",
		
	#MM3
	8: "Peterchy",
	9: "Potton",
	11: "Hammer Joe",
	159: "Mechakkero",
	13: "Pole Egg",
	20: "Pole",
	14: "New Shotman",
	46: "Petit Snakey",
	67: "Komasaburo",
	68: "Hari Harry",
	69: "Cannon",
	70: "Walking Bomb",
	71: "Gyoraibo",
	72: "Yambow",
	73: "Mag Fly",
	179: "Electric Gabyoall",
	108: "Bubukan",
	163: "Nitron",
	175: "Elec'n",
	176: "Bomb Flier",
	177: "Hologran",
	178: "Giant Springer",
	74: "Tama",
		
	#MM4
	31: "Skeleton Joe",
	34: "Togehero",
	30: "Shield Attacker",
	32: "Super Ball Machine Jr.",
	33: "Skullmet",
	35: "Taketento",
	36: "Gachappon",
	75: "Minoan",
	76: "Wall Blaster",
	77: "Totem Polen",
	78: "Pakatto 24",
	79: "Docron",
	80: "Docron Spawner",
	81: "Mummira",
	82: "Garyoby",
	164: "Ladder Press",
	192: "Helipon",
	193: "Ring Ring",
	194: "Battan",
	195: "Sea Mine",
	196: "Sea Mine Spawner",
	197: "Ratton",
	83: "Whopper",
		
	#MM5
	39: "Train Met",
	23: "Crystal Joe",
	29: "Shield Attacker (MM5)",
	27: "Pukapelly",
	28: "Lyrics",
	37: "Kouker",
	38: "Bitter",
	55: "Power Muscler",
	84: "Bomb Thrown",
	85: "Metall Cannon",
	86: "Subeil",
	87: "Giree",
	88: "Giree Spawner",
	89: "Tondeall",
	90: "Pukapucker",
	91: "Bounder",
	180: "Sumatran",
	181: "Bombier",
	186: "Cocco",
	187: "Jet Bomb (Horizontal)",
	188: "Jet Bomb (Vertical)",
	189: "V",
		
	#MM6
	6: "Colton",
	10: "Shield Attacker (MM6)",
	42: "Fire Telly",
	40: "Au Au",
	41: "Ben K",
	43: "Cannopeller",
	44: "Twin Roader",
	54: "Brain Break",
	92: "Katonbyon",
	93: "Curlinger",
	94: "SRU-21/P",
	95: "Gabgyo",
	96: "Pooker",
	97: "Cyber Gabyoall",
	99: "Yaffu",
	182: "Hotchkiss'n",
	183: "Molier",
	184: "Submarine Flier",
	185: "Propeller Eye",
	190: "Skull Walker",
	191: "Brown",
	98: "Squidon",
	
	#MM7
	100: "Tripropellan",
	101: "Icicle Teck",
	102: "Trio The Wheel",
	103: "Baccone",
	104: "Tom Daddy",
	105: "Frisk Cannon",
	106: "Gockroach S",
	107: "Gockroach S Nest",
	109: "Turbo Roader",
	110: "Kaminari Kogoro",
	111: "Cyorown",
	112: "Gobots",
	113: "Tsuranattori",
		
	#MM8
	125: "Shell'n",
	126: "Bunby Tank DX",
	127: "Joe Classic",
	128: "Surumaker",
	129: "Hannya Attacker",
	130: "Crunchran",
	134: "Fire Met",
	135: "Fire Met (Spawner)",
	137: "Wall Teck",
	131: "Rabbiton",
	132: "PenPen EV",
	133: "Big Telly",
	
	#MM9
	24: "Petit Devil",
	26: "CariCarry",
	115: "Bombomboy",
	114: "Flower Presenter",
	116: "Fire Totem",
	117: "Okosutobon",
	118: "Dairn",
	119: "Hoo Hoo",
	120: "Hoo Hoo (Spawner)",
	121: "Kakinbarank",
	122: "Adamski",
	123: "Nombrellan",
	136: "Nombrellan (Spawner)",
	124: "Sakrets",
	198: "Bunby Catcher",
		
	#MM10
	138: "Cargou Q",
	139: "Kaona Geeno",
	140: "Pointan",
	141: "Sola O",
	142: "Oshitsu Osarettsu",
	143: "Numetall",
	144: "Merserker",
	145: "Bari III (Head)",
	146: "Bari III (Body)",
	147: "Mecha Pitchan",
	148: "Searchy",
	200: "Searchy (Spawner)",
	160: "Returning Machine Gun Joe",
	165: "Neo Heli Metall",
	168: "Momole",
	169: "Momole (Spawner)",
	202: "Momole (Random)",
		
	#MM11
	149: "Electro Guard",
	150: "Electritri",
	152: "Electritri (Spawner)",
	151: "Electritri (Spawner Solid)",
	153: "Pipetto",
	154: "Anti-Eddie",
	155: "Air Stone/Fire/Nut",
	156: "Mash Burner",
	157: "Crunch Don",
	
	#MM&B
	203: "Electric Generator",
	204: "Plasma +-",
	205: "Gori Three",
	206: "Dodonpa Cannon",
	207: "Mokumokumo",
	208: "Romper",
	209: "Romper G (unused)",
	210: "Hogale",
	211: "Hogale (Spawner)",
	212: "Kamikamin",
	213: "Snoler",
	214: "Big Telly (Fire)",
	216: "Ammoner",
	224: "Oni Robo Cloud",
	225: "Oni Robo Wind",
	226: "Oni Robo",
	227: "Sydecka",
	
	#MMGB
	215: "Hyoey",
	217: "Biribaree",
	218: "Piribaree",
	219: "Doncatch",
	220: "Hell Metall DX",
	221: "Metall Sniper",
	222: "Fukuhorn",
	223: "Press'n",
	228: "Cutting Wheel",
	229: "Tamp",
	230: "La Jaba",
	231: "Fankrow",
	232: "Shuhorn",
	233: "Chainsoar"
	
}

const BoneEnemies = [31,79,80,157,190]

const MiniBosses = [62,74,83,98,170,213,215,224,225,226]

#-------------------------------------------------
#      Properties
#-------------------------------------------------

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

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
