# Script_Name_Here
# Written by: 

extends Reference

class_name GameSpikeData

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

const SPIKE_TILE_COUNT = 5
const SPIKE_DATA = {
	2 : "SpMM1Cut",
	7 : "SpMM1Guts",
	8 : "SpMM1Wily1",
	9 : "SpMM1Wily2",
	15 : "SpMM2Bubble",
	56 : "SpMM3Spark",
	57 : "SpMM3Gemini2",
	58 : "SpMM3Magnet",
	59 : "SpMM3Wily8",
	60 : "SpMM3Wily9",
	61 : "SpMM3Wily11",
	62 : "SpMM4Ring",
	63 : "SpMM4Skull",
	64 : "SpMM4Bright",
	65 : "SpMM4Drill",
	66 : "SpMM4Toad",
	67 : "SpMM4Pharaoh",
	68 : "SpMM4Cossack1",
	69 : "SpMM4Cossack2",
	70 : "SpMM4Wily12",
	71 : "SpMM4Wily13",
	72 : "SpMM5Gravity",
	73 : "SpMM5Crystal",
	74 : "SpMM5Napalm-alt",
	75 : "SpMM5Gyro",
	76 : "SpMM5Star",
	77 : "SpMM5Wave",
	78 : "SpMM5Charge",
	79 : "SpMM5Dark1",
	80 : "SpMM5Dark2",
	81 : "SpMM5Dark4",
	82 : "SpMM5Dark5",
	83 : "SpMM5Wily16",
	84 : "SpMM5Wily17",
	85 : "SpMM6Blizzard",
	86 : "SpMM6Wind-alt",
	87 : "SpMM6Tomahawk",
	88 : "SpMM6Centaur",
	89 : "SpMM6Knight",
	90 : "SpMM6Yamato",
	91 : "SpMM6Plant",
	92 : "SpMM6MrX1",
	93 : "SpMM6MrX2",
	94 : "SpMM6MrX3",
	95 : "SpMM6Wily20",
	96 : "SpMM6Wily23",
	154 : "SpMM7Freeze",
	155 : "SpMM7Shade",
	156 : "SpMM7Wily26",
	289 : "SpMM2Wily3",
	290 : "SpMM2Wily5",
	291 : "SpMM3Spark-alt",
	292 : "SpMM3Needle",
	293 : "SpMM3Top",
	294 : "SpMM3Shadow2",
	295 : "SpMM3Shadow",
	296 : "SpMM3Wily7",
	297 : "SpMM3Wily6",
	298 : "SpMM4Dive",
	299 : "SpMM4Dive-alt",
	300 : "SpMM4Dust",
	301 : "SpMM5Stone",
	302 : "SpMM5Napalm",
	303 : "SpMM5Dark3",
	304 : "SpMM5Wily14",
	305 : "SpMM5Wily15",
	306 : "SpMM5Wily18",
	307 : "SpMM5Wily19",
	308 : "SpMM6Wind",
	309 : "SpMM6Flame",
	310 : "SpMM6Tomahawk-alt",
	311 : "SpMM6Centaur2",
	312 : "SpMM6Centaur2-alt",
	313 : "SpMM6Knight-alt",
	314 : "SpMM6Knight2",
	315 : "SpMM6Knight2-alt",
	316 : "SpMM6Yamato-alt",
	317 : "SpMM6Yamato2",
	318 : "SpMM6Yamato2-alt",
	319 : "SpMM6Wily22",
	320 : "SpMM7Spring",
	321 : "SpMM7Slash",
	322 : "SpMM7Burst",
	323 : "SpMM7Burst-alt",
	324 : "SpMM7Burst2",
	325 : "SpMM7Burst2-alt",
	326 : "SpMM7Turbo",
	327 : "SpMM7Wily27",
	328 : "SpMM8Aqua2",
	329 : "SpMM8Aqua",
	330 : "SpMM8Search",
	331 : "SpMM8Clown",
	332 : "SpMM8Duo",
	333 : "SpMM8Wily29",
	334 : "SpMM9Concrete",
	335 : "SpMM9Jewel",
	336 : "SpMM9Hornet",
	337 : "SpMM9Plug",
	338 : "SpMM9Plug2",
	339 : "SpMM9Splash",
	340 : "SpMM9Splash-alt",
	341 : "SpMM9Splash-alt2",
	342 : "SpMM9Splash2",
	343 : "SpMM9Galaxy",
	344 : "SpMM9Tornado",
	345 : "SpMM9Wily30",
	346 : "SpMM9Wily32",
	347 : "SpMM9Wily33",
	348 : "SpMM9Wily35",
	349 : "SpMM9Fake",
	350 : "SpMM9Endless1",
	351 : "SpMM9Endless2",
	352 : "SpMM9Endless3",
	353 : "SpMM2Wily4",
	354 : "SpMM3Gemini3",
	355 : "SpMM3Gemini3-alt3",
	356 : "SpMM3Gemini3-alt2",
	357 : "SpMM3Gemini",
	358 : "SpMM7Wily24",
	359 : "SpMM7Wily25",
	360 : "SpMM8Frost",
	361 : "SpMM8Sword",
	362 : "SpMM8Grenade",
	363 : "SpMM9Wily34",
	426 : "SpMM6Blizzard2",
	427 : "SpMM6Wily21",
	474 : "SpMM7Wily28",
	595 : "SpMM3Wily10",
	596 : "SpMM6Tomahawk-alt2",
	597 : "SpMM9Wily31",
	598 : "SpMM10Blade",
	599 : "SpMM10Sheep",
	600 : "SpMM10Commando",
	601 : "SpMM10Pump",
	602 : "SpMM10Pump-alt",
	603 : "SpMM10Nitro",
	604 : "SpMM10Chill",
	605 : "SpMM10Chill-alt",
	606 : "SpMM10Chill-alt2",
	607 : "SpMM10Chill-alt3",
	608 : "SpMM10Wily36",
	609 : "SpMM10Wily37",
	610 : "SpMM10Wily38",
	611 : "SpMM10Wily39",
	612 : "SpMM10Enker",
	613 : "SpMM10Enker-alt",
	614 : "SpMM10Punk",
	615 : "SpMM10Ballade",
	616 : "SpMM10Endless4",
	617 : "SpMM10Endless5",
	618 : "SpMM10Challenge",
	619 : "SpMM10Challenge-alt",
	620 : "SpMM10Difficulty",
	670 : "SpMM11Acid",
	671 : "SpMM11Acid2",
	672 : "SpMM11Blast",
	673 : "SpMM11Tundra",
	674 : "SpMM11Impact",
	675 : "SpMM11Wily40",
	676 : "SpMM11Light",
	680 : "SpMM11Wily41",
	723 : "SpMMPUBomb",
	724 : "SpMMPUBuilder2",
	725 : "SpMMPUBuilder3",
	726 : "SpMMPUBuilder4",
	727 : "SpMMPUBuilder1",
	728 : "SpMMPUCut",
	729 : "SpMMPUElec",
	730 : "SpMMPUFire",
	731 : "SpMMPUGuts",
	732 : "SpMMPUIce",
	733 : "SpMMPUOil",
	734 : "SpMMPUTime",
	735 : "SpMMPUWily1",
	736 : "SpMMPUWily2",
	737 : "SpMMPUWily3"
}

const SUBTILE_ID_POSITIONS = {
	0 : Vector2(16, 0),
	1 : Vector2(16, 32),
	2 : Vector2(0, 16),
	3 : Vector2(32, 16),
	4 : Vector2(0, 0)
}

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
