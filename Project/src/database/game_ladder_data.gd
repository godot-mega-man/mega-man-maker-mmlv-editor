# Script_Name_Here
# Written by: 

extends Reference

class_name GameLadderData

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

const LADDER_DATA = {
	6 : "LadMM1Cut",
	10 : "LadMM1Cut",
	11 : "LadMM1Cut",
	12 : "LadMM1Cut",
	13 : "LadMM1Cut",
	14 : "LadMM1Cut",
	16 : "LadMM1Cut",
	17 : "LadMM1Cut",
	18 : "LadMM1Cut",
	19 : "LadMM1Cut",
	20 : "LadMM1Cut",
	97 : "LadMM1Cut",
	98 : "LadMM1Cut",
	99 : "LadMM1Cut",
	100 : "LadMM1Cut",
	101 : "LadMM1Cut",
	102 : "LadMM1Cut",
	103 : "LadMM1Cut",
	104 : "LadMM1Cut",
	105 : "LadMM1Cut",
	106 : "LadMM1Cut",
	107 : "LadMM1Cut",
	108 : "LadMM1Cut",
	109 : "LadMM1Cut",
	110 : "LadMM1Cut",
	111 : "LadMM1Cut",
	112 : "LadMM1Cut",
	113 : "LadMM1Cut",
	114 : "LadMM1Cut",
	115 : "LadMM1Cut",
	116 : "LadMM1Cut",
	117 : "LadMM1Cut",
	118 : "LadMM1Cut",
	119 : "LadMM1Cut",
	120 : "LadMM1Cut",
	121 : "LadMM1Cut",
	122 : "LadMM1Cut",
	123 : "LadMM1Cut",
	124 : "LadMM1Cut",
	125 : "LadMM1Cut",
	126 : "LadMM1Cut",
	127 : "LadMM1Cut",
	128 : "LadMM1Cut",
	365 : "LadMM1Cut",
	366 : "LadMM1Cut",
	367 : "LadMM1Cut",
	368 : "LadMM1Cut",
	369 : "LadMM1Cut",
	370 : "LadMM1Cut",
	371 : "LadMM1Cut",
	372 : "LadMM1Cut",
	373 : "LadMM1Cut",
	374 : "LadMM1Cut",
	375 : "LadMM1Cut",
	376 : "LadMM1Cut",
	377 : "LadMM1Cut",
	378 : "LadMM1Cut",
	379 : "LadMM1Cut",
	380 : "LadMM1Cut",
	381 : "LadMM1Cut",
	382 : "LadMM1Cut",
	383 : "LadMM1Cut",
	384 : "LadMM1Cut",
	385 : "LadMM1Cut",
	386 : "LadMM1Cut",
	388 : "LadMM1Cut",
	389 : "LadMM1Cut",
	390 : "LadMM1Cut",
	391 : "LadMM1Cut",
	392 : "LadMM1Cut",
	393 : "LadMM1Cut",
	394 : "LadMM1Cut",
	395 : "LadMM1Cut",
	396 : "LadMM1Cut",
	397 : "LadMM1Cut",
	398 : "LadMM1Cut",
	399 : "LadMM1Cut",
	400 : "LadMM1Cut",
	401 : "LadMM1Cut",
	402 : "LadMM1Cut",
	403 : "LadMM1Cut",
	404 : "LadMM1Cut",
	405 : "LadMM1Cut",
	406 : "LadMM1Cut",
	407 : "LadMM1Cut",
	408 : "LadMM1Cut",
	409 : "LadMM1Cut",
	410 : "LadMM1Cut",
	411 : "LadMM1Cut",
	412 : "LadMM1Cut",
	413 : "LadMM1Cut",
	414 : "LadMM1Cut",
	415 : "LadMM1Cut",
	416 : "LadMM1Cut",
	417 : "LadMM1Cut",
	418 : "LadMM1Cut",
	419 : "LadMM1Cut",
	420 : "LadMM1Cut",
	421 : "LadMM1Cut",
	422 : "LadMM1Cut",
	423 : "LadMM1Cut",
	424 : "LadMM1Cut",
	425 : "LadMM1Cut",
	428 : "LadMM1Cut",
	429 : "LadMM1Cut",
	430 : "LadMM1Cut",
	431 : "LadMM1Cut",
	434 : "LadMM1Cut",
	573 : "LadMM1Cut",
	574 : "LadMM1Cut",
	575 : "LadMM1Cut",
	576 : "LadMM1Cut",
	577 : "LadMM1Cut",
	578 : "LadMM1Cut",
	579 : "LadMM1Cut",
	580 : "LadMM1Cut",
	581 : "LadMM1Cut",
	582 : "LadMM1Cut",
	583 : "LadMM1Cut",
	584 : "LadMM1Cut",
	585 : "LadMM1Cut",
	586 : "LadMM1Cut",
	587 : "LadMM1Cut",
	588 : "LadMM1Cut",
	589 : "LadMM1Cut",
	590 : "LadMM1Cut",
	591 : "LadMM1Cut",
	592 : "LadMM1Cut",
	593 : "LadMM1Cut",
	594 : "LadMM1Cut",
	659 : "LadMM1Cut",
	660 : "LadMM1Cut",
	661 : "LadMM1Cut",
	662 : "LadMM1Cut",
	663 : "LadMM1Cut",
	664 : "LadMM1Cut",
	665 : "LadMM1Cut",
	666 : "LadMM1Cut",
	667 : "LadMM1Cut",
	668 : "LadMM1Cut",
	669 : "LadMM1Cut",
	704 : "LadMM1Cut",
	705 : "LadMM1Cut",
	706 : "LadMM1Cut",
	707 : "LadMM1Cut",
	708 : "LadMM1Cut",
	709 : "LadMM1Cut",
	710 : "LadMM1Cut",
	711 : "LadMM1Cut",
	712 : "LadMM1Cut",
	713 : "LadMM1Cut",
	714 : "LadMM1Cut",
	715 : "LadMM1Cut",
	716 : "LadMM1Cut",
	717 : "LadMM1Cut",
	718 : "LadMM1Cut",
	719 : "LadMM1Cut",
	720 : "LadMM1Cut",
	721 : "LadMM1Cut"
}

const LADDER_GAME_IDS = {
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
	#855 : 99,
	#856 : 99,
	#857 : 99,
	#858 : 99,
	#859 : 99,
	#860 : 99,
	#861 : 99,
	#862 : 99,
	#863 : 99,
	#864 : 99,
	#865 : 99,
	#866 : 99,
	#867 : 99,
	#868 : 99,
	#869 : 99,
	#870 : 99,
	#871 : 99,
	#872 : 99,
	#873 : 99,
	#874 : 99,
	#875 : 99,
	#876 : 99,
	#877 : 99,
	#878 : 99,
	#879 : 99,
	#880 : 99,
	#881 : 99,
	#882 : 99,
	#883 : 99,
	#884 : 99,
	#885 : 99,
	#886 : 99,
	#887 : 99

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
