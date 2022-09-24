# GameTileSetData
# Written by: First

extends Reference

class_name GameTileSetData

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

const SUBTILE_COUNT = 77

#These data contains filenames used for generating tilemap.
#TilemapGenerator scene can be found in the project.
const TILESET_DATA = {
	0 : "TstMM6Tomahawk",
	1 : "TstMM2Quick",
	3 : "TstMM1Cut",
	4 : "TstMM1Guts",
	5 : "TstMM1Elec",
	21 : "TstMM1Ice",
	22 : "TstMM1Fire",
	23 : "TstMM1Bomb",
	24 : "TstMM2Bubble",
	25 : "TstMM2Air",
	26 : "TstMM2Wood",
	27 : "TstMM2Crash",
	28 : "TstMM2Metal",
	29 : "TstMM2Heat",
	30 : "TstMM3Spark1",
	31 : "TstMM3Snake",
	32 : "TstMM3Needle",
	33 : "TstMM3Top",
	34 : "TstMM3Magnet",
	35 : "TstMM3Gemini",
	36 : "TstMM3Hard",
	37 : "TstMM4Ring",
	38 : "TstMM4Dive",
	39 : "TstMM4Skull",
	40 : "TstMM4Bright1",
	41 : "TstMM4Dust2",
	42 : "TstMM4Drill",
	43 : "TstMM4Toad2",
	44 : "TstMM4Pharaoh",
	45 : "TstMM5Stone2",
	46 : "TstMM5Gravity",
	47 : "TstMM5Napalm",
	48 : "TstMM5Gyro",
	49 : "TstMM5Star",
	50 : "TstMM5Charge",
	51 : "TstMM6Blizzard",
	52 : "TstMM6Wind",
	53 : "TstMM6Centaur",
	54 : "TstMM6Knight",
	55 : "TstMM6Yamato",
	129 : "TstMM1Time",
	130 : "TstMM1Oil",
	131 : "TstMM1Wily1-2",
	132 : "TstMM2Wily1-4",
	133 : "TstMM2Wily2",
	134 : "TstMM2Wily4",
	135 : "TstMM2Wily6",
	136 : "TstMM3Wily1-3",
	137 : "TstMM3Wily2",
	138 : "TstMM3Wily3",
	142 : "TstMM4Cossack1-2",
	143 : "TstMM4Cossack3",
	144 : "TstMM4Wily1",
	145 : "TstMM4Wily2",
	146 : "TstMM5Dark1",
	147 : "TstMM5Dark2",
	148 : "TstMM5Dark3",
	149 : "TstMM5Wily1",
	150 : "TstMM6MrX2-3",
	151 : "TstMM6Wily1-2",
	152 : "TstMM6Wily2",
	153 : "TstMM6Wily3",
	157 : "TstMM7Spring",
	158 : "TstMM7Freeze",
	159 : "TstMM7Shade",
	160 : "TstMM7Slash",
	161 : "TstMM7Junk",
	162 : "TstMM7Shade2",
	163 : "TstMM7Burst",
	164 : "TstMM7Turbo",
	165 : "TstMM7Cloud",
	166 : "TstMM7Wily1",
	167 : "TstMM1Wily2",
	168 : "TstMM1Wily3",
	169 : "TstMM1Wily4",
	170 : "TstMM2Wily3",
	171 : "TstMM3Wily4-3",
	172 : "TstMM3Wily5",
	173 : "TstMM3Wily6",
	174 : "TstMM5Dark4",
	175 : "TstMM6Wily2Alt",
	198 : "TstMM1Wily1",
	199 : "TstMM2BubbleAlt",
	200 : "TstMM2QuickAlt",
	201 : "TstMM2Wily1",
	202 : "TstMM2Wily3Alt",
	203 : "TstMM2Wily5",
	204 : "TstMM3Shadow",
	205 : "TstMM3Wily1-3Alt",
	206 : "TstMM3Wily1",
	207 : "TstMM3Wily1-2",
	208 : "TstMM3Wily4",
	209 : "TstMM4DiveAlt",
	210 : "TstMM4Dust4",
	211 : "TstMM4Drill2",
	212 : "TstMM4Toad",
	213 : "TstMM4Cossack1",
	214 : "TstMM4Cossack2",
	215 : "TstMM4Cossack4",
	216 : "TstMM4Wily3",
	217 : "TstMM4Wily4",
	218 : "TstMM5Stone",
	219 : "TstMM5Napalm2",
	220 : "TstMM5Wave1",
	221 : "TstMM5Dark2-4",
	222 : "TstMM5Dark3-2",
	223 : "TstMM5Wily2",
	224 : "TstMM5Wily2Alt",
	225 : "TstMM5Wily3",
	226 : "TstMM5Wily4",
	227 : "TstMM6Blizzard2",
	228 : "TstMM6Wind2",
	229 : "TstMM6Flame",
	230 : "TstMM6Flame2",
	231 : "TstMM6TomahawkAlt",
	232 : "TstMM6Tomahawk2",
	233 : "TstMM6Tomahawk2Alt",
	234 : "TstMM6Tomahawk3",
	235 : "TstMM6Tomahawk3Alt",
	236 : "TstMM6CentaurAlt",
	237 : "TstMM6KnightAlt",
	238 : "TstMM6Knight2",
	239 : "TstMM6Knight2Alt",
	240 : "TstMM6YamatoAlt",
	241 : "TstMM6Yamato5",
	242 : "TstMM6Yamato5Alt",
	243 : "TstMM6Yamato7",
	244 : "TstMM6Yamato7Alt",
	245 : "TstMM6Yamato6",
	246 : "TstMM6Yamato6Alt",
	247 : "TstMM6Yamato4",
	248 : "TstMM6Yamato4Alt",
	249 : "TstMM6Plant",
	250 : "TstMM6MrX1",
	251 : "TstMM6MrX1-2",
	252 : "TstMM6MrX3",
	253 : "TstMM6MrX4",
	254 : "TstMM6Wily1Alt",
	255 : "TstMM6Wily4",
	256 : "TstMM9Concrete",
	257 : "TstMM9Hornet",
	258 : "TstMM9Plug",
	259 : "TstMM9Magma",
	260 : "TstMM9Splash1",
	261 : "TstMM9Galaxy",
	262 : "TstMM9Tornado",
	263 : "TstMM9Wily1",
	264 : "TstMM9Wily2Animated1",
	265 : "TstMM9Wily2Alt1",
	266 : "TstMM9Wily3Animated1",
	267 : "TstMM9Wily4Animated1",
	268 : "TstMM9FakeAnimated1",
	269 : "TstMM9Endless",
	270 : "TstMM9Endless2",
	271 : "TstMM9Endless2Alt",
	272 : "TstMM9Endless2Alt2",
	273 : "TstMM9Endless3",
	274 : "TstMM9Endless3Alt",
	275 : "TstMM9Endless4",
	276 : "TstMM9Endless5",
	277 : "TstMM9Endless6",
	278 : "TstMM9Endless4Alt",
	279 : "TstMM9Endless7",
	280 : "TstMM9Endless8",
	281 : "TstMM9Endless8Alt",
	282 : "TstMM9Endless9",
	283 : "TstMM9Endless9Alt",
	284 : "TstMM9Endless10",
	285 : "TstMM5Crystal1",
	286 : "TstMM9Jewel",
	287 : "TstMM9Wily4Alt1",
	288 : "TstMM9Tornado2",
	432 : "TstMM4Pharaoh2",
	433 : "TstMM3Needle2",
	435 : "TstMM3Snake4",
	436 : "TstMM3Top2",
	437 : "TstMM5Star2",
	438 : "TstMM5Star2Alt",
	439 : "TstMM5Charge3",
	440 : "TstMM6Flame3",
	441 : "TstMM6Centaur2",
	442 : "TstMM6Centaur2Alt",
	443 : "TstMM6MrX2",
	444 : "TstMM9Concrete2",
	445 : "TstMM9MagmaTile",
	446 : "TstMM2Flash",
	447 : "TstMM2Flash2",
	448 : "TstMM2FlashAnimated1",
	449 : "TstMM2Flash2Animated1",
	450 : "TstMM2Flash3Animated1",
	451 : "TstMM3Gemini2",
	452 : "TstMM3Gemini3",
	453 : "TstMM3Gemini4",
	454 : "TstMM3Gemini2Animated1",
	455 : "TstMM3Gemini3Animated1",
	456 : "TstMM3Gemini4Animated1",
	457 : "TstMM2Wily1-2",
	458 : "TstMM7Spring2",
	459 : "TstMM9Wily1-2",
	460 : "TstMM9Wily1-2Alt",
	462 : "TstMM8Tengu",
	463 : "TstMM8Frost",
	464 : "TstMM8FrostAlt",
	465 : "TstMM8Grenade",
	466 : "TstMM8Clown",
	467 : "TstMM8Astro",
	468 : "TstMM8Astro2",
	469 : "TstMM8Astro2Alt",
	470 : "TstMM8Sword",
	471 : "TstMM8Aqua",
	472 : "TstMM8Search",
	473 : "TstMM8Wily1",
	475 : "TstMM8Wily2",
	476 : "TstMM8Wily2Alt",
	477 : "TstMM1Elec2Animated1",
	478 : "TstMM1TimeAlt",
	479 : "TstMM4Wily3-2",
	480 : "TstMM5CrystalAlt1",
	481 : "TstMM5Wily1-2",
	482 : "TstMM7Shade2Alt",
	483 : "TstMM7Wily2",
	484 : "TstMM7Wily3",
	485 : "TstMM7Wily4",
	486 : "TstMM9Concrete3",
	487 : "TstMM9Fake2Animated1",
	488 : "TstMM10Blade",
	489 : "TstMM10Blade2",
	490 : "TstMM10SolarAnimated1",
	491 : "TstMM10Solar2Animated1",
	492 : "TstMM10Solar3Animated1",
	493 : "TstMM10Sheep1",
	494 : "TstMM10Commando",
	495 : "TstMM10Pump",
	496 : "TstMM10PumpAlt",
	497 : "TstMM10Pump2",
	498 : "TstMM10Pump2Alt",
	499 : "TstMM10Strike",
	500 : "TstMM10Strike2",
	501 : "TstMM10Nitro",
	502 : "TstMM10Nitro2",
	503 : "TstMM10ChillAnimated1",
	504 : "TstMM10Chill2",
	505 : "TstMM10Wily1",
	506 : "TstMM10Wily1-2",
	507 : "TstMM10Wily1-3",
	508 : "TstMM10Wily2",
	509 : "TstMM10Wily2-2",
	510 : "TstMM10Wily2-3",
	511 : "TstMM10Wily3",
	512 : "TstMM10Wily3Alt",
	513 : "TstMM10Wily3-2",
	514 : "TstMM10Wily3-2Alt",
	515 : "TstMM10Wily4",
	516 : "TstMM10Wily4Alt",
	517 : "TstMM10Wily5Animated1",
	518 : "TstMM10Wily5-3Animated1",
	519 : "TstMM10Enker",
	520 : "TstMM10Enker2",
	521 : "TstMM10Enker3",
	522 : "TstMM10Enker4",
	523 : "TstMM10Enker5",
	524 : "TstMM10Enker6",
	525 : "TstMM10Punk",
	526 : "TstMM10Punk2",
	527 : "TstMM10Punk3",
	528 : "TstMM10Punk4Animated1",
	529 : "TstMM10Ballade",
	530 : "TstMM10Ballade2",
	531 : "TstMM10Endless",
	532 : "TstMM10Endless2",
	533 : "TstMM10Endless3",
	534 : "TstMM10Endless3Alt",
	535 : "TstMM10Endless4",
	536 : "TstMM10Endless5",
	537 : "TstMM10Endless6",
	538 : "TstMM10Endless6Alt",
	539 : "TstMM10Endless7",
	540 : "TstMM10Endless8",
	541 : "TstMM10Endless9",
	542 : "TstMM10Endless10",
	543 : "TstMM10Endless11Animated1",
	544 : "TstMM10Endless12",
	545 : "TstMM10Endless13",
	546 : "TstMM10Endless14",
	547 : "TstMM10Endless15",
	548 : "TstMM10Endless16",
	549 : "TstMM10Endless17",
	550 : "TstMM10Endless18",
	551 : "TstMM10Endless18Alt",
	552 : "TstMM10Endless19",
	553 : "TstMM10Endless20",
	554 : "TstMM10Endless21",
	555 : "TstMM10Endless21Alt",
	556 : "TstMM10Endless22",
	557 : "TstMM10Endless22Alt",
	558 : "TstMM10Endless23",
	559 : "TstMM10Endless24",
	560 : "TstMM10Endless25",
	561 : "TstMM10Endless25Alt",
	562 : "TstMM10Endless26",
	563 : "TstMM10Endless27",
	564 : "TstMM10Endless28",
	565 : "TstMM10Endless29",
	566 : "TstMM10Challenge1Animated1",
	567 : "TstMM10Challenge1AltAnimated1",
	568 : "TstMM10Challenge1Alt2Animated1",
	569 : "TstMM10Challenge2Animated1",
	570 : "TstMM10Challenge2AltAnimated1",
	571 : "TstMM10Challenge3",
	572 : "TstMM10Difficulty",
	629 : "TstMM3Magnet2",
	630 : "TstMM4Pharaoh3",
	631 : "TstMM4Cossack3-2",
	632 : "TstMM4Cossack4-2",
	633 : "TstMM5Star3",
	634 : "TstMM6Wind4",
	635 : "TstMM6MrX3Alt",
	636 : "TstMM10Wily5-2Animated1",
	637 : "TstMM10Wily5-4Animated1",
	638 : "TstMM6Tomahawk4",
	639 : "TstMM6Tomahawk4Alt",
	640 : "TstMM7Burst2",
	641 : "TstMM7Burst3",
	642 : "TstMM7Burst3Alt",
	643 : "TstMM7Turbo2",
	644 : "TstMM7Turbo3",
	645 : "TstMM7Turbo4",
	646 : "TstMM11Block",
	647 : "TstMM11Acid",
	648 : "TstMM11Blast",
	649 : "TstMM11Bounce1",
	650 : "TstMM11Tundra",
	651 : "TstMM11Impact",
	652 : "TstMM11Torch1",
	653 : "TstMM11Fuse",
	654 : "TstMM11Fuse2Animated1",
	655 : "TstMM11Wily1Animated1",
	656 : "TstMM11Wily1-2Animated1",
	657 : "TstMM11Wily2Animated1",
	658 : "TstMM11Wily2AltAnimated1",
	677 : "TstMM10Wily1-4",
	678 : "TstMM11Wily2Alt2Animated1",
	679 : "TstMM11Wily2Alt3Animated1",
	681 : "TstMM10Endless30" ,
	682 : "TstMM1Bomb2" , # 1.7
	683 : "TstMM1Guts2" ,
	684 : "TstMM1Guts3" ,
	685 : "TstMM1Ice2" ,
	686 : "TstMM1Wily1-3" ,
	687 : "TstMM10Commando2" ,
	688 : "TstMM10Endless3Alt2" ,
	689 : "TstMM10Sheep2" ,
	690 : "TstMM11Tundra2" ,
	691 : "TstMM11TundraAlt" ,
	692 : "TstMM1BombPU" ,
	693 : "TstMM1Builder" ,
	694 : "TstMM1Builder2" ,
	695 : "TstMM1Builder3" ,
	696 : "TstMM1Builder4" ,
	697 : "TstMM1ChallengeAlt" ,
	698 : "TstMM1Challenge" ,
	699 : "TstMM1CutPU" ,
	700 : "TstMM1ElecPU" ,
	701 : "TstMM1FirePU" ,
	702 : "TstMM1GutsPU" ,
	703 : "TstMM1IcePU" ,
	722 : "TstMM1Oil2" ,
	738 : "TstMM1Time2" ,
	739 : "TstMM1Time3" ,
	741 : "TstMM2Crash2" ,
	742 : "TstMM2Heat2" ,
	743 : "TstMM2Metal2" ,
	744 : "TstMM2Metal3" ,
	745 : "TstMM2Wily1-3" ,
	746 : "TstMM3Needle3" ,
	747 : "TstMM3Snake2" ,
	748 : "TstMM3Snake3" ,
	749 : "TstMM3Wily1-4" ,
	750 : "TstMM3Wily1-4Alt" ,
	751 : "TstMM3Wily4-2" ,
	753 : "TstMM4Bright4" ,
	754 : "TstMM4Bright3" ,
	755 : "TstMM4Cossack1-2Alt" ,
	756 : "TstMM4Cossack1-3" ,
	757 : "TstMM4Cossack1-3Alt" ,
	758 : "TstMM4Cossack2-2" ,
	759 : "TstMM4Cossack2-3" ,
	760 : "TstMM4Cossack4-4" ,
	761 : "TstMM4Cossack4-3" ,
	762 : "TstMM4Dust" ,
	763 : "TstMM4DustAlt" ,
	764 : "TstMM4Dust3" ,
	765 : "TstMM4Pharaoh4" ,
	766 : "TstMM4Ring2" ,
	767 : "TstMM4Ring4" ,
	768 : "TstMM4Ring3" ,
	769 : "TstMM4Toad2Alt" ,
	770 : "TstMM4Toad3" ,
	771 : "TstMM4Toad3Alt" ,
	772 : "TstMM4Toad4" ,
	773 : "TstMM4Toad4Alt" ,
	774 : "TstMM4Wily1-2" ,
	775 : "TstMM4Wily1-3" ,
	776 : "TstMM4Wily2-2" ,
	777 : "TstMM4Wily4-2" ,
	778 : "TstMM5Charge4" ,
	779 : "TstMM5Charge5" ,
	780 : "TstMM5Charge2" ,
	781 : "TstMM5Charge6" ,
	782 : "TstMM5Charge6Alt" ,
	783 : "TstMM5Dark1-3" ,
	784 : "TstMM5Dark1-3Alt" ,
	785 : "TstMM5Dark1-4" ,
	786 : "TstMM5Dark1-2" ,
	787 : "TstMM5Dark2-2" ,
	788 : "TstMM5Dark2-3" ,
	789 : "TstMM5Dark2-5" ,
	790 : "TstMM5Dark2-6" ,
	791 : "TstMM5Dark3-3" ,
	792 : "TstMM5Dark3-4" ,
	793 : "TstMM5Dark3-5" ,
	794 : "TstMM5GyroAlt" ,
	795 : "TstMM5GyroAlt2" ,
	796 : "TstMM5GyroAlt3" ,
	797 : "TstMM5Stone3" ,
	798 : "TstMM5Stone4" ,
	799 : "TstMM5StoneAlt" ,
	800 : "TstMM5Wave2" ,
	801 : "TstMM5Wily2-2" ,
	802 : "TstMM5Wily3-2" ,
	803 : "TstMM6Blizzard3" ,
	804 : "TstMM6Centaur3" ,
	805 : "TstMM6Centaur3Alt" ,
	806 : "TstMM6MrX1-4" ,
	807 : "TstMM6MrX1-5" ,
	808 : "TstMM6MrX1-6" ,
	809 : "TstMM6MrX1-3" ,
	810 : "TstMM6MrX2-2" ,
	811 : "TstMM6MrX2-4" ,
	812 : "TstMM6MrX3-2" ,
	813 : "TstMM6MrX4-2" ,
	814 : "TstMM6MrX4Alt",
	815 : "TstMM6Plant2" ,
	816 : "TstMM6Plant3" ,
	817 : "TstMM6Wily1-5" ,
	818 : "TstMM6Wily1-5Alt" ,
	819 : "TstMM6Wily1-6" ,
	820 : "TstMM6Wily1-6Alt" ,
	821 : "TstMM6Wily1" ,
	822 : "TstMM6Wily1-3" ,
	823 : "TstMM6Wily1-3Alt" ,
	824 : "TstMM6Wily1-4" ,
	825 : "TstMM6Wily1-4Alt" ,
	826 : "TstMM6Wily2-2Alt" ,
	827 : "TstMM6Wily3-2" ,
	828 : "TstMM6Wind3" ,
	829 : "TstMM6Wind2Alt" ,
	830 : "TstMM6Yamato3" ,
	831 : "TstMM6Yamato3Alt" ,
	832 : "TstMM6Yamato2" ,
	833 : "TstMM6Yamato2Alt" ,
	834 : "TstMM7Cloud2" ,
	835 : "TstMM7Freeze2" ,
	836 : "TstMM7Intro" ,
	837 : "TstMM7Wily2-2" ,
	838 : "TstMM7Wily3-2" ,
	839 : "TstMM7Wily3-4" ,
	840 : "TstMM7Wily3-3" ,
	841 : "TstMM8Intro2" ,
	842 : "TstMM8Intro2Alt" ,
	843 : "TstMM8SwordAlt" ,
	844 : "TstMM8Wily3" ,
	845 : "TstMM8Wily3-2" ,
	846 : "TstMM8Wily3-2Alt" ,
	847 : "TstMM8Wily4" ,
	848 : "TstMM9Fake3" ,
	849 : "TstMM8Intro" ,
	850 : "TstMM6Wily2-2" ,
	851 : "TstMM5Wily4-2" ,
	852 : "TstMM8Astro2Alt2" ,
	853 : "TstMM1Builder3Alt",
	#854 : "",
	855 : "TstMMBIntro1",
	856 : "TstMMBIntro2",
	857 : "TstMMBGround2",
	858 : "TstMMBCrystalGate1",
	859 : "TstMMBKing1_3",
	860 : "TstMMBPirate2",
	861 : "TstMMBPirate2Alt",
	#862 : "TstMMBPirate2Alt2",
	#863 : "TstMMBPirate2Alt3",
	864 : "TstMMBIntro3",
	865 : "TstMMBIntro4",
	#866 : "",
	#867 : "",
	868 : "TstMMBCold1",
	869 : "TstMMBCold2",
	870 : "TstMMBCold3",
	871 : "TstMMBCold4",
	#872 : "",
	#873 : "",
	874 : "TstMMBBurner1",
	875 : "TstMMBBurner2",
	876 : "TstMMBBurner3",
	#877 : "",
	#878 : "",
	879 : "TstMMBPirate1",
	880 : "TstMMBPirate3",
	881 : "TstMMBPirate4",
	#882 : "",
	#883 : "",
	884 : "TstMMBGround1",
	#885 : "",
	#886 : "",
	887 : "TstMMBTengu1"
	
}

const SUBTILE_POSITION_IDS := {
	Vector2(1, 1) : 0,
	Vector2(18, 1) : 1,
	Vector2(36, 1) : 2,
	Vector2(53, 1) : 3,
	Vector2(71, 1) : 4,
	Vector2(88, 1) : 5,
	Vector2(106, 1) : 6,
	Vector2(123, 1) : 7,
	Vector2(141, 1) : 8,
	Vector2(158, 1) : 9,
	
	Vector2(1, 18) : 10,
	Vector2(18, 18) : 11,
	Vector2(36, 18) : 12,
	Vector2(53, 18) : 13,
	Vector2(71, 18) : 14,
	Vector2(88, 18) : 15,
	Vector2(106, 18) : 16,
	Vector2(123, 18) : 17,
	Vector2(141, 18) : 18,
	Vector2(158, 18) : 19,
	
	Vector2(1, 36) : 20,
	Vector2(18, 36) : 21,
	Vector2(36, 36) : 22,
	Vector2(53, 36) : 23,
	Vector2(71, 36) : 24,
	Vector2(88, 36) : 25,
	Vector2(106, 36) : 26,
	Vector2(123, 36) : 27,
	Vector2(141, 36) : 28,
	Vector2(158, 36) : 29,
	
	Vector2(1, 53) : 30,
	Vector2(18, 53) : 31,
	Vector2(36, 53) : 32,
	Vector2(53, 53) : 33,
	Vector2(71, 53) : 34,
	Vector2(88, 53) : 35,
	Vector2(106, 53) : 36,
	Vector2(123, 53) : 37,
	Vector2(141, 53) : 38,
	Vector2(158, 53) : 39,
	
	Vector2(1, 71) : 40,
	Vector2(18, 71) : 41,
	Vector2(36, 71) : 42,
	Vector2(53, 71) : 43,
	Vector2(71, 71) : 44,
	Vector2(88, 71) : 45,
	Vector2(106, 71) : 46,
	Vector2(123, 71) : 47,
	Vector2(141, 71) : 48,
	
	Vector2(1, 88) : 49,
	Vector2(18, 88) : 50,
	Vector2(36, 88) : 51,
	Vector2(53, 88) : 52,
	Vector2(71, 88) : 53,
	Vector2(88, 88) : 54,
	Vector2(106, 88) : 55,
	Vector2(123, 88) : 56,
	
	Vector2(1, 106) : 57,
	Vector2(18, 106) : 58,
	Vector2(36, 106) : 59,
	Vector2(53, 106) : 60,
	Vector2(71, 106) : 61,
	Vector2(88, 106) : 62,
	Vector2(106, 106) : 63,
	Vector2(123, 106) : 64,
	
	Vector2(1, 123) : 65,
	Vector2(18, 123) : 66,
	Vector2(36, 123) : 67,
	Vector2(53, 123) : 68,
	Vector2(71, 123) : 69,
	Vector2(88, 123) : 70,
	Vector2(106, 123) : 71,
	Vector2(123, 123) : 72,
	
	Vector2(106, 141) : 73,
	Vector2(123, 141) : 74,
	
	Vector2(106, 158) : 75,
	Vector2(123, 158) : 76,
	
}

# These are used for generating a tileset
# TileID : OffsetToAdd
const SUBTILE_TEXTURE_OFFSETS := {
	0 : Vector2(0, 0),
	1 : Vector2(0, 0),
	3 : Vector2(0, 0),
	4 : Vector2(0, 0),
	5 : Vector2(0, 0),
	21 : Vector2(0, 0),
	22 : Vector2(0, 0),
	23 : Vector2(0, 0),
	24 : Vector2(0, 0),
	25 : Vector2(0, 0),
	26 : Vector2(0, 0),
	27 : Vector2(0, 0),
	28 : Vector2(0, 0),
	29 : Vector2(0, 0),
	30 : Vector2(0, 0),
	31 : Vector2(0, 0),
	32 : Vector2(0, 0),
	33 : Vector2(0, 0),
	34 : Vector2(0, 0),
	35 : Vector2(0, 0),
	36 : Vector2(0, 0),
	37 : Vector2(0, 0),
	38 : Vector2(0, 0),
	39 : Vector2(0, 0),
	40 : Vector2(0, 0),
	41 : Vector2(0, 0),
	42 : Vector2(0, 0),
	43 : Vector2(0, 0),
	44 : Vector2(0, 0),
	45 : Vector2(0, 0),
	46 : Vector2(0, 0),
	47 : Vector2(0, 0),
	48 : Vector2(0, 0),
	49 : Vector2(0, 0),
	50 : Vector2(0, 0),
	51 : Vector2(0, 0),
	52 : Vector2(0, 0),
	53 : Vector2(0, 0),
	54 : Vector2(0, 0),
	55 : Vector2(0, 0),
	129 : Vector2(0, 0),
	130 : Vector2(0, 0),
	131 : Vector2(0, 0),
	132 : Vector2(0, 0),
	133 : Vector2(0, 0),
	134 : Vector2(0, 0),
	135 : Vector2(0, 0),
	136 : Vector2(0, 0),
	137 : Vector2(0, 0),
	138 : Vector2(0, 0),
	142 : Vector2(0, 0),
	143 : Vector2(0, 0),
	144 : Vector2(0, 0),
	145 : Vector2(0, 0),
	146 : Vector2(0, 0),
	147 : Vector2(0, 0),
	148 : Vector2(0, 0),
	149 : Vector2(0, 0),
	150 : Vector2(0, 0),
	151 : Vector2(0, 0),
	152 : Vector2(0, 0),
	153 : Vector2(0, 0),
	157 : Vector2(0, 0),
	158 : Vector2(0, 0),
	159 : Vector2(0, 0),
	160 : Vector2(0, 0),
	161 : Vector2(0, 0),
	162 : Vector2(0, 0),
	163 : Vector2(0, 0),
	164 : Vector2(0, 0),
	165 : Vector2(0, 0),
	166 : Vector2(0, 0),
	167 : Vector2(0, 0),
	168 : Vector2(0, 0),
	169 : Vector2(0, 0),
	170 : Vector2(0, 0),
	171 : Vector2(0, 0),
	172 : Vector2(0, 0),
	173 : Vector2(0, 0),
	174 : Vector2(0, 0),
	175 : Vector2(0, 0),
	198 : Vector2(1, 1),
	199 : Vector2(1, 1),
	200 : Vector2(1, 1),
	201 : Vector2(0, 0),
	202 : Vector2(1, 1),
	203 : Vector2(1, 1),
	204 : Vector2(1, 1),
	205 : Vector2(1, 1),
	206 : Vector2(1, 1),
	207 : Vector2(1, 1),
	208 : Vector2(1, 1),
	209 : Vector2(1, 1),
	210 : Vector2(1, 1),
	211 : Vector2(1, 1),
	212 : Vector2(1, 1),
	213 : Vector2(1, 1),
	214 : Vector2(1, 1),
	215 : Vector2(1, 1),
	216 : Vector2(1, 1),
	217 : Vector2(1, 1),
	218 : Vector2(1, 1),
	219 : Vector2(1, 1),
	220 : Vector2(1, 1),
	221 : Vector2(1, 1),
	222 : Vector2(1, 1),
	223 : Vector2(1, 1),
	224 : Vector2(1, 1),
	225 : Vector2(1, 1),
	226 : Vector2(1, 1),
	227 : Vector2(1, 1),
	228 : Vector2(1, 1),
	229 : Vector2(1, 1),
	230 : Vector2(1, 1),
	231 : Vector2(1, 1),
	232 : Vector2(1, 1),
	233 : Vector2(1, 1),
	234 : Vector2(1, 1),
	235 : Vector2(1, 1),
	236 : Vector2(1, 1),
	237 : Vector2(1, 1),
	238 : Vector2(1, 1),
	239 : Vector2(1, 1),
	240 : Vector2(1, 1),
	241 : Vector2(1, 1),
	242 : Vector2(1, 1),
	243 : Vector2(1, 1),
	244 : Vector2(1, 1),
	245 : Vector2(1, 1),
	246 : Vector2(1, 1),
	247 : Vector2(1, 1),
	248 : Vector2(1, 1),
	249 : Vector2(1, 1),
	250 : Vector2(1, 1),
	251 : Vector2(1, 1),
	252 : Vector2(1, 1),
	253 : Vector2(1, 1),
	254 : Vector2(1, 1),
	255 : Vector2(1, 1),
	256 : Vector2(1, 1),
	257 : Vector2(1, 1),
	258 : Vector2(1, 1),
	259 : Vector2(1, 1),
	260 : Vector2(1, 1),
	261 : Vector2(1, 1),
	262 : Vector2(1, 1),
	263 : Vector2(1, 1),
	264 : Vector2(1, 1),
	265 : Vector2(1, 1),
	266 : Vector2(1, 1),
	267 : Vector2(1, 1),
	268 : Vector2(1, 1),
	269 : Vector2(1, 1),
	270 : Vector2(1, 1),
	271 : Vector2(1, 1),
	272 : Vector2(1, 1),
	273 : Vector2(1, 1),
	274 : Vector2(1, 1),
	275 : Vector2(1, 1),
	276 : Vector2(1, 1),
	277 : Vector2(1, 1),
	278 : Vector2(1, 1),
	279 : Vector2(1, 1),
	280 : Vector2(1, 1),
	281 : Vector2(1, 1),
	282 : Vector2(1, 1),
	283 : Vector2(1, 1),
	284 : Vector2(1, 1),
	285 : Vector2(0, 0),
	286 : Vector2(1, 1),
	287 : Vector2(1, 1),
	288 : Vector2(1, 1),
	432 : Vector2(1, 1),
	433 : Vector2(1, 1),
	435 : Vector2(1, 1),
	436 : Vector2(1, 1),
	437 : Vector2(1, 1),
	438 : Vector2(1, 1),
	439 : Vector2(1, 1),
	440 : Vector2(1, 1),
	441 : Vector2(1, 1),
	442 : Vector2(1, 1),
	443 : Vector2(1, 1),
	444 : Vector2(1, 1),
	445 : Vector2(1, 1),
	446 : Vector2(1, 1),
	447 : Vector2(1, 1),
	448 : Vector2(1, 1),
	449 : Vector2(1, 1),
	450 : Vector2(1, 1),
	451 : Vector2(1, 1),
	452 : Vector2(1, 1),
	453 : Vector2(1, 1),
	454 : Vector2(1, 1),
	455 : Vector2(1, 1),
	456 : Vector2(1, 1),
	457 : Vector2(0, 0),
	458 : Vector2(1, 1),
	459 : Vector2(1, 1),
	460 : Vector2(1, 1),
	462 : Vector2(1, 1),
	463 : Vector2(0, 0),
	464 : Vector2(0, 0),
	465 : Vector2(1, 1),
	466 : Vector2(1, 1),
	467 : Vector2(1, 1),
	468 : Vector2(1, 1),
	469 : Vector2(1, 1),
	470 : Vector2(1, 1),
	471 : Vector2(1, 1),
	472 : Vector2(1, 1),
	473 : Vector2(1, 1),
	475 : Vector2(1, 1),
	476 : Vector2(1, 1),
	477 : Vector2(1, 1),
	478 : Vector2(1, 1),
	479 : Vector2(1, 1),
	480 : Vector2(1, 1),
	481 : Vector2(1, 1),
	482 : Vector2(1, 1),
	483 : Vector2(1, 1),
	484 : Vector2(1, 1),
	485 : Vector2(1, 1),
	486 : Vector2(1, 1),
	487 : Vector2(1, 1),
	488 : Vector2(1, 1),
	489 : Vector2(1, 1),
	490 : Vector2(1, 1),
	491 : Vector2(1, 1),
	492 : Vector2(1, 1),
	493 : Vector2(1, 1),
	494 : Vector2(1, 1),
	495 : Vector2(1, 1),
	496 : Vector2(1, 1),
	497 : Vector2(1, 1),
	498 : Vector2(1, 1),
	499 : Vector2(1, 1),
	500 : Vector2(1, 1),
	501 : Vector2(1, 1),
	502 : Vector2(1, 1),
	503 : Vector2(1, 1),
	504 : Vector2(1, 1),
	505 : Vector2(1, 1),
	506 : Vector2(1, 1),
	507 : Vector2(1, 1),
	508 : Vector2(1, 1),
	509 : Vector2(1, 1),
	510 : Vector2(1, 1),
	511 : Vector2(1, 1),
	512 : Vector2(1, 1),
	513 : Vector2(1, 1),
	514 : Vector2(1, 1),
	515 : Vector2(1, 1),
	516 : Vector2(1, 1),
	517 : Vector2(1, 1),
	518 : Vector2(1, 1),
	519 : Vector2(1, 1),
	520 : Vector2(1, 1),
	521 : Vector2(1, 1),
	522 : Vector2(1, 1),
	523 : Vector2(1, 1),
	524 : Vector2(0, 0),
	525 : Vector2(1, 1),
	526 : Vector2(1, 1),
	527 : Vector2(0, 0),
	528 : Vector2(1, 1),
	529 : Vector2(1, 1),
	530 : Vector2(1, 1),
	531 : Vector2(1, 1),
	532 : Vector2(1, 1),
	533 : Vector2(0, 0),
	534 : Vector2(1, 1),
	535 : Vector2(0, 0),
	536 : Vector2(0, 0),
	537 : Vector2(0, 0),
	538 : Vector2(1, 1),
	539 : Vector2(0, 0),
	540 : Vector2(1, 1),
	541 : Vector2(1, 1),
	542 : Vector2(0, 0),
	543 : Vector2(1, 1),
	544 : Vector2(1, 1),
	545 : Vector2(1, 1),
	546 : Vector2(0, 0),
	547 : Vector2(1, 1),
	548 : Vector2(1, 1),
	549 : Vector2(0, 0),
	550 : Vector2(0, 0),
	551 : Vector2(0, 0),
	552 : Vector2(1, 1),
	553 : Vector2(1, 1),
	554 : Vector2(0, 0),
	555 : Vector2(0, 0),
	556 : Vector2(1, 1),
	557 : Vector2(0, 0),
	558 : Vector2(0, 0),
	559 : Vector2(1, 1),
	560 : Vector2(1, 1),
	561 : Vector2(1, 1),
	562 : Vector2(1, 1),
	563 : Vector2(1, 1),
	564 : Vector2(1, 1),
	565 : Vector2(0, 0),
	566 : Vector2(1, 1),
	567 : Vector2(1, 1),
	568 : Vector2(1, 1),
	569 : Vector2(0, 0),
	570 : Vector2(0, 0),
	571 : Vector2(1, 1),
	572 : Vector2(1, 1),
	629 : Vector2(1, 1),
	630 : Vector2(1, 1),
	631 : Vector2(1, 1),
	632 : Vector2(1, 1),
	633 : Vector2(1, 1),
	634 : Vector2(1, 1),
	635 : Vector2(1, 1),
	636 : Vector2(1, 1),
	637 : Vector2(1, 1),
	638 : Vector2(1, 1),
	639 : Vector2(1, 1),
	640 : Vector2(1, 1),
	641 : Vector2(1, 1),
	642 : Vector2(1, 1),
	643 : Vector2(1, 1),
	644 : Vector2(1, 1),
	645 : Vector2(1, 1),
	646 : Vector2(0, 0),
	647 : Vector2(1, 1),
	648 : Vector2(1, 1),
	649 : Vector2(1, 1),
	650 : Vector2(1, 1),
	651 : Vector2(1, 1),
	652 : Vector2(1, 1),
	653 : Vector2(1, 1),
	654 : Vector2(1, 1),
	655 : Vector2(1, 1),
	656 : Vector2(1, 1),
	657 : Vector2(1, 1),
	658 : Vector2(1, 1),
	677 : Vector2(1, 1),
	678 : Vector2(1, 1),
	679 : Vector2(1, 1),
	681 : Vector2(0, 0),
	682 : Vector2(0, 0) ,
	683 : Vector2(0, 0) ,
	684 : Vector2(0, 0) ,
	685 : Vector2(0, 0) ,
	686 : Vector2(0, 0) ,
	687 : Vector2(0, 0) ,
	688 : Vector2(0, 0) ,
	689 : Vector2(0, 0) ,
	690 : Vector2(0, 0) ,
	691 : Vector2(0, 0) ,
	692 : Vector2(0, 0) ,
	693 : Vector2(0, 0) ,
	694 : Vector2(0, 0) ,
	695 : Vector2(0, 0) ,
	696 : Vector2(0, 0) ,
	697 : Vector2(0, 0) ,
	698 : Vector2(0, 0) ,
	699 : Vector2(0, 0) ,
	700 : Vector2(0, 0) ,
	701 : Vector2(0, 0) ,
	702 : Vector2(0, 0) ,
	703 : Vector2(0, 0) ,
	722 : Vector2(0, 0) ,
	738 : Vector2(0, 0) ,
	739 : Vector2(0, 0) ,
	741 : Vector2(0, 0) ,
	742 : Vector2(0, 0) ,
	743 : Vector2(0, 0) ,
	744 : Vector2(0, 0) ,
	745 : Vector2(0, 0) ,
	746 : Vector2(0, 0) ,
	747 : Vector2(0, 0) ,
	748 : Vector2(0, 0) ,
	749 : Vector2(0, 0) ,
	750 : Vector2(0, 0) ,
	751 : Vector2(0, 0) ,
	753 : Vector2(0, 0) ,
	754 : Vector2(0, 0) ,
	755 : Vector2(0, 0) ,
	756 : Vector2(0, 0) ,
	757 : Vector2(0, 0) ,
	758 : Vector2(0, 0) ,
	759 : Vector2(0, 0) ,
	760 : Vector2(0, 0) ,
	761 : Vector2(0, 0) ,
	762 : Vector2(0, 0) ,
	763 : Vector2(0, 0) ,
	764 : Vector2(0, 0) ,
	765 : Vector2(0, 0) ,
	766 : Vector2(0, 0) ,
	767 : Vector2(0, 0) ,
	768 : Vector2(0, 0) ,
	769 : Vector2(0, 0) ,
	770 : Vector2(0, 0) ,
	771 : Vector2(0, 0) ,
	772 : Vector2(0, 0) ,
	773 : Vector2(0, 0) ,
	774 : Vector2(0, 0) ,
	775 : Vector2(0, 0) ,
	776 : Vector2(0, 0) ,
	777 : Vector2(0, 0) ,
	778 : Vector2(0, 0) ,
	779 : Vector2(0, 0) ,
	780 : Vector2(0, 0) ,
	781 : Vector2(0, 0) ,
	782 : Vector2(0, 0) ,
	783 : Vector2(0, 0) ,
	784 : Vector2(0, 0) ,
	785 : Vector2(0, 0) ,
	786 : Vector2(0, 0) ,
	787 : Vector2(0, 0) ,
	788 : Vector2(0, 0) ,
	789 : Vector2(0, 0) ,
	790 : Vector2(0, 0) ,
	791 : Vector2(0, 0) ,
	792 : Vector2(0, 0) ,
	793 : Vector2(0, 0) ,
	794 : Vector2(0, 0) ,
	795 : Vector2(0, 0) ,
	796 : Vector2(0, 0) ,
	797 : Vector2(0, 0) ,
	798 : Vector2(0, 0) ,
	799 : Vector2(0, 0) ,
	800 : Vector2(0, 0) ,
	801 : Vector2(0, 0) ,
	802 : Vector2(0, 0) ,
	803 : Vector2(0, 0) ,
	804 : Vector2(0, 0) ,
	805 : Vector2(0, 0) ,
	806 : Vector2(0, 0) ,
	807 : Vector2(0, 0) ,
	808 : Vector2(0, 0) ,
	809 : Vector2(0, 0) ,
	810 : Vector2(0, 0) ,
	811 : Vector2(0, 0) ,
	812 : Vector2(0, 0) ,
	813 : Vector2(0, 0) ,
	814 : Vector2(0, 0) ,
	815 : Vector2(0, 0) ,
	816 : Vector2(0, 0) ,
	817 : Vector2(0, 0) ,
	818 : Vector2(0, 0) ,
	819 : Vector2(0, 0) ,
	820 : Vector2(0, 0) ,
	821 : Vector2(0, 0) ,
	822 : Vector2(0, 0) ,
	823 : Vector2(0, 0) ,
	824 : Vector2(0, 0) ,
	825 : Vector2(0, 0) ,
	826 : Vector2(0, 0) ,
	827 : Vector2(0, 0) ,
	828 : Vector2(0, 0) ,
	829 : Vector2(0, 0) ,
	830 : Vector2(0, 0) ,
	831 : Vector2(0, 0) ,
	832 : Vector2(0, 0) ,
	833 : Vector2(0, 0) ,
	834 : Vector2(0, 0) ,
	835 : Vector2(0, 0) ,
	836 : Vector2(0, 0) ,
	837 : Vector2(0, 0) ,
	838 : Vector2(0, 0) ,
	839 : Vector2(0, 0) ,
	840 : Vector2(0, 0) ,
	841 : Vector2(0, 0) ,
	842 : Vector2(0, 0) ,
	843 : Vector2(0, 0) ,
	844 : Vector2(0, 0) ,
	845 : Vector2(0, 0) ,
	846 : Vector2(0, 0) ,
	847 : Vector2(0, 0) ,
	848 : Vector2(0, 0) ,
	849 : Vector2(0, 0) ,
	850 : Vector2(0, 0) ,
	851 : Vector2(0, 0) ,
	852 : Vector2(0, 0) ,
	853 : Vector2(0, 0),
	855 : Vector2(1, 1),
	856 : Vector2(1, 1),
	857 : Vector2(1, 1),
	858 : Vector2(1, 1),
	859 : Vector2(1, 1),
	860 : Vector2(1, 1),
	861 : Vector2(1, 1),
	#862 : "TstMMBPirate2Alt2",
	#863 : "TstMMBPirate2Alt3",
	864 : Vector2(1, 1),
	865 : Vector2(1, 1),
	#866 : "",
	#867 : "",
	868 : Vector2(1, 1),
	869 : Vector2(1, 1),
	870 : Vector2(1, 1),
	871 : Vector2(1, 1),
	#872 : "",
	#873 : "",
	874 : Vector2(1, 1),
	875 : Vector2(1, 1),
	876 : Vector2(1, 1),
	#877 : "",
	#878 : "",
	879 : Vector2(1, 1),
	880 : Vector2(1, 1),
	881 : Vector2(1, 1),
	#882 : "",
	#883 : "",
	884 : Vector2(1, 1),
	#885 : "",
	#886 : "",
	887 : Vector2(1, 1),
}

# TileID : GameID
const TILE_GAME_IDS = {
	0 : 6 ,
	1 : 2 ,
	3 : 1 ,
	4 : 1 ,
	5 : 1 ,
	21 : 1 ,
	22 : 1 ,
	23 : 1 ,
	24 : 2 ,
	25 : 2 ,
	26 : 2 ,
	27 : 2 ,
	28 : 2 ,
	29 : 2 ,
	30 : 3 ,
	31 : 3 ,
	32 : 3 ,
	33 : 3 ,
	34 : 3 ,
	35 : 3 ,
	36 : 3 ,
	37 : 4 ,
	38 : 4 ,
	39 : 4 ,
	40 : 4 ,
	41 : 4 ,
	42 : 4 ,
	43 : 4 ,
	44 : 4 ,
	45 : 5 ,
	46 : 5 ,
	47 : 5 ,
	48 : 5 ,
	49 : 5 ,
	50 : 5 ,
	51 : 6 ,
	52 : 6 ,
	53 : 6 ,
	54 : 6 ,
	55 : 6 ,
	129 : 1 ,
	130 : 1 ,
	131 : 1 ,
	132 : 2 ,
	133 : 2 ,
	134 : 2 ,
	135 : 2 ,
	136 : 3 ,
	137 : 3 ,
	138 : 3 ,
	142 : 4 ,
	143 : 4 ,
	144 : 4 ,
	145 : 4 ,
	146 : 5 ,
	147 : 5 ,
	148 : 5 ,
	149 : 5 ,
	150 : 6 ,
	151 : 6 ,
	152 : 6 ,
	153 : 6 ,
	157 : 7 ,
	158 : 7 ,
	159 : 7 ,
	160 : 7 ,
	161 : 7 ,
	162 : 7 ,
	163 : 7 ,
	164 : 7 ,
	165 : 7 ,
	166 : 7 ,
	167 : 1 ,
	168 : 1 ,
	169 : 1 ,
	170 : 2 ,
	171 : 3 ,
	172 : 3 ,
	173 : 3 ,
	174 : 5 ,
	175 : 6 ,
	198 : 1 ,
	199 : 2 ,
	200 : 2 ,
	201 : 2 ,
	202 : 2 ,
	203 : 2 ,
	204 : 3 ,
	205 : 3 ,
	206 : 3 ,
	207 : 3 ,
	208 : 3 ,
	209 : 4 ,
	210 : 4 ,
	211 : 4 ,
	212 : 4 ,
	213 : 4 ,
	214 : 4 ,
	215 : 4 ,
	216 : 4 ,
	217 : 4 ,
	218 : 5 ,
	219 : 5 ,
	220 : 5 ,
	221 : 5 ,
	222 : 5 ,
	223 : 5 ,
	224 : 5 ,
	225 : 5 ,
	226 : 5 ,
	227 : 6 ,
	228 : 6 ,
	229 : 6 ,
	230 : 6 ,
	231 : 6 ,
	232 : 6 ,
	233 : 6 ,
	234 : 6 ,
	235 : 6 ,
	236 : 6 ,
	237 : 6 ,
	238 : 6 ,
	239 : 6 ,
	240 : 6 ,
	241 : 6 ,
	242 : 6 ,
	243 : 6 ,
	244 : 6 ,
	245 : 6 ,
	246 : 6 ,
	247 : 6 ,
	248 : 6 ,
	249 : 6 ,
	250 : 6 ,
	251 : 6 ,
	252 : 6 ,
	253 : 6 ,
	254 : 6 ,
	255 : 6 ,
	256 : 9 ,
	257 : 9 ,
	258 : 9 ,
	259 : 9 ,
	260 : 9 ,
	261 : 9 ,
	262 : 9 ,
	263 : 9 ,
	264 : 9 ,
	265 : 9 ,
	266 : 9 ,
	267 : 9 ,
	268 : 9 ,
	269 : 9 ,
	270 : 9 ,
	271 : 9 ,
	272 : 9 ,
	273 : 9 ,
	274 : 9 ,
	275 : 9 ,
	276 : 9 ,
	277 : 9 ,
	278 : 9 ,
	279 : 9 ,
	280 : 9 ,
	281 : 9 ,
	282 : 9 ,
	283 : 9 ,
	284 : 9 ,
	285 : 5 ,
	286 : 9 ,
	287 : 9 ,
	288 : 9 ,
	432 : 4 ,
	433 : 3 ,
	435 : 3 ,
	436 : 3 ,
	437 : 5 ,
	438 : 5 ,
	439 : 5 ,
	440 : 6 ,
	441 : 6 ,
	442 : 6 ,
	443 : 6 ,
	444 : 9 ,
	445 : 9 ,
	446 : 2 ,
	447 : 2 ,
	448 : 2 ,
	449 : 2 ,
	450 : 2 ,
	451 : 3 ,
	452 : 3 ,
	453 : 3 ,
	454 : 3 ,
	455 : 3 ,
	456 : 3 ,
	457 : 2 ,
	458 : 7 ,
	459 : 9 ,
	460 : 9 ,
	462 : 8 ,
	463 : 8 ,
	464 : 8 ,
	465 : 8 ,
	466 : 8 ,
	467 : 8 ,
	468 : 8 ,
	469 : 8 ,
	470 : 8 ,
	471 : 8 ,
	472 : 8 ,
	473 : 8 ,
	475 : 8 ,
	476 : 8 ,
	477 : 1 ,
	478 : 1 ,
	479 : 4 ,
	480 : 5 ,
	481 : 5 ,
	482 : 7 ,
	483 : 7 ,
	484 : 7 ,
	485 : 7 ,
	486 : 9 ,
	487 : 9 ,
	488 : 10 ,
	489 : 10 ,
	490 : 10 ,
	491 : 10 ,
	492 : 10 ,
	493 : 10 ,
	494 : 10 ,
	495 : 10 ,
	496 : 10 ,
	497 : 10 ,
	498 : 10 ,
	499 : 10 ,
	500 : 10 ,
	501 : 10 ,
	502 : 10 ,
	503 : 10 ,
	504 : 10 ,
	505 : 10 ,
	506 : 10 ,
	507 : 10 ,
	508 : 10 ,
	509 : 10 ,
	510 : 10 ,
	511 : 10 ,
	512 : 10 ,
	513 : 10 ,
	514 : 10 ,
	515 : 10 ,
	516 : 10 ,
	517 : 10 ,
	518 : 10 ,
	519 : 10 ,
	520 : 10 ,
	521 : 10 ,
	522 : 10 ,
	523 : 10 ,
	524 : 10 ,
	525 : 10 ,
	526 : 10 ,
	527 : 10 ,
	528 : 10 ,
	529 : 10 ,
	530 : 10 ,
	531 : 10 ,
	532 : 10 ,
	533 : 10 ,
	534 : 10 ,
	535 : 10 ,
	536 : 10 ,
	537 : 10 ,
	538 : 10 ,
	539 : 10 ,
	540 : 10 ,
	541 : 10 ,
	542 : 10 ,
	543 : 10 ,
	544 : 10 ,
	545 : 10 ,
	546 : 10 ,
	547 : 10 ,
	548 : 10 ,
	549 : 10 ,
	550 : 10 ,
	551 : 10 ,
	552 : 10 ,
	553 : 10 ,
	554 : 10 ,
	555 : 10 ,
	556 : 10 ,
	557 : 10 ,
	558 : 10 ,
	559 : 10 ,
	560 : 10 ,
	561 : 10 ,
	562 : 10 ,
	563 : 10 ,
	564 : 10 ,
	565 : 10 ,
	566 : 10 ,
	567 : 10 ,
	568 : 10 ,
	569 : 10 ,
	570 : 10 ,
	571 : 10 ,
	572 : 10 ,
	629 : 3 ,
	630 : 4 ,
	631 : 4 ,
	632 : 4 ,
	633 : 5 ,
	634 : 6 ,
	635 : 6 ,
	636 : 10 ,
	637 : 10 ,
	638 : 6 ,
	639 : 6 ,
	640 : 7 ,
	641 : 7 ,
	642 : 7 ,
	643 : 7 ,
	644 : 7 ,
	645 : 7 ,
	646 : 11 ,
	647 : 11 ,
	648 : 11 ,
	649 : 11 ,
	650 : 11 ,
	651 : 11 ,
	652 : 11 ,
	653 : 11 ,
	654 : 11 ,
	655 : 11 ,
	656 : 11 ,
	657 : 11 ,
	658 : 11 ,
	677 : 10 ,
	678 : 11 ,
	679 : 11 ,
	681 : 10 ,
	682 : 1 ,
	683 : 1 ,
	684 : 1 ,
	685 : 1 ,
	686 : 1 ,
	687 : 10 ,
	688 : 10 ,
	689 : 10 ,
	690 : 11 ,
	691 : 11 ,
	692 : 1 ,
	693 : 1 ,
	694 : 1 ,
	695 : 1 ,
	696 : 1 ,
	697 : 1 ,
	698 : 1 ,
	699 : 1 ,
	700 : 1 ,
	701 : 1 ,
	702 : 1 ,
	703 : 1 ,
	722 : 1 ,
	738 : 1 ,
	739 : 1 ,
	741 : 2 ,
	742 : 2 ,
	743 : 2 ,
	744 : 2 ,
	745 : 2 ,
	746 : 3 ,
	747 : 3 ,
	748 : 3 ,
	749 : 3 ,
	750 : 3 ,
	751 : 3 ,
	753 : 4 ,
	754 : 4 ,
	755 : 4 ,
	756 : 4 ,
	757 : 4 ,
	758 : 4 ,
	759 : 4 ,
	760 : 4 ,
	761 : 4 ,
	762 : 4 ,
	763 : 4 ,
	764 : 4 ,
	765 : 4 ,
	766 : 4 ,
	767 : 4 ,
	768 : 4 ,
	769 : 4 ,
	770 : 4 ,
	771 : 4 ,
	772 : 4 ,
	773 : 4 ,
	774 : 4 ,
	775 : 4 ,
	776 : 4 ,
	777 : 4 ,
	778 : 5 ,
	779 : 5 ,
	780 : 5 ,
	781 : 5 ,
	782 : 5 ,
	783 : 5 ,
	784 : 5 ,
	785 : 5 ,
	786 : 5 ,
	787 : 5 ,
	788 : 5 ,
	789 : 5 ,
	790 : 5 ,
	791 : 5 ,
	792 : 5 ,
	793 : 5 ,
	794 : 5 ,
	795 : 5 ,
	796 : 5 ,
	797 : 5 ,
	798 : 5 ,
	799 : 5 ,
	800 : 5 ,
	801 : 5 ,
	802 : 5 ,
	803 : 6 ,
	804 : 6 ,
	805 : 6 ,
	806 : 6 ,
	807 : 6 ,
	808 : 6 ,
	809 : 6 ,
	810 : 6 ,
	811 : 6 ,
	812 : 6 ,
	813 : 6 ,
	814 : 6 ,
	815 : 6 ,
	816 : 6 ,
	817 : 6 ,
	818 : 6 ,
	819 : 6 ,
	820 : 6 ,
	821 : 6 ,
	822 : 6 ,
	823 : 6 ,
	824 : 6 ,
	825 : 6 ,
	826 : 6 ,
	827 : 6 ,
	828 : 6 ,
	829 : 6 ,
	830 : 6 ,
	831 : 6 ,
	832 : 6 ,
	833 : 6 ,
	834 : 7 ,
	835 : 7 ,
	836 : 7 ,
	837 : 7 ,
	838 : 7 ,
	839 : 7 ,
	840 : 7 ,
	841 : 8 ,
	842 : 8 ,
	843 : 8 ,
	844 : 8 ,
	845 : 8 ,
	846 : 8 ,
	847 : 8 ,
	848 : 9 ,
	849 : 8 ,
	850 : 6 ,
	851 : 5 ,
	852 : 8 ,
	853 : 1,
	#854 : 99,
	855 : 99,
	856 : 99,
	857 : 99,
	858 : 99,
	859 : 99,
	860 : 99,
	861 : 99,
	862 : 99,
	863 : 99,
	864 : 99,
	865 : 99,
	#866 : 99,
	#867 : 99,
	868 : 99,
	869 : 99,
	870 : 99,
	871 : 99,
	#872 : 99,
	#873 : 99,
	874 : 99,
	875 : 99,
	876 : 99,
	#877 : 99,
	#878 : 99,
	879 : 99,
	880 : 99,
	881 : 99,
	#882 : 99,
	#883 : 99,
	884 : 99,
	#885 : 99,
	#886 : 99,
	887 : 99

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
