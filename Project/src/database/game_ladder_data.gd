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
