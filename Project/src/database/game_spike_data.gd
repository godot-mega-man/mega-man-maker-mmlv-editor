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
	7 : "SpMM1Cut",
	8 : "SpMM1Cut",
	9 : "SpMM1Cut",
	15 : "SpMM1Cut",
	56 : "SpMM1Cut",
	57 : "SpMM1Cut",
	58 : "SpMM1Cut",
	59 : "SpMM1Cut",
	60 : "SpMM1Cut",
	61 : "SpMM1Cut",
	62 : "SpMM1Cut",
	63 : "SpMM1Cut",
	64 : "SpMM1Cut",
	65 : "SpMM1Cut",
	66 : "SpMM1Cut",
	67 : "SpMM1Cut",
	68 : "SpMM1Cut",
	69 : "SpMM1Cut",
	70 : "SpMM1Cut",
	71 : "SpMM1Cut",
	72 : "SpMM1Cut",
	73 : "SpMM1Cut",
	74 : "SpMM1Cut",
	75 : "SpMM1Cut",
	76 : "SpMM1Cut",
	77 : "SpMM1Cut",
	78 : "SpMM1Cut",
	79 : "SpMM1Cut",
	80 : "SpMM1Cut",
	81 : "SpMM1Cut",
	82 : "SpMM1Cut",
	83 : "SpMM1Cut",
	84 : "SpMM1Cut",
	85 : "SpMM1Cut",
	86 : "SpMM1Cut",
	87 : "SpMM1Cut",
	88 : "SpMM1Cut",
	89 : "SpMM1Cut",
	90 : "SpMM1Cut",
	91 : "SpMM1Cut",
	92 : "SpMM1Cut",
	93 : "SpMM1Cut",
	94 : "SpMM1Cut",
	95 : "SpMM1Cut",
	96 : "SpMM1Cut",
	154 : "SpMM1Cut",
	155 : "SpMM1Cut",
	156 : "SpMM1Cut",
	289 : "SpMM1Cut",
	290 : "SpMM1Cut",
	291 : "SpMM1Cut",
	292 : "SpMM1Cut",
	293 : "SpMM1Cut",
	294 : "SpMM1Cut",
	295 : "SpMM1Cut",
	296 : "SpMM1Cut",
	297 : "SpMM1Cut",
	298 : "SpMM1Cut",
	299 : "SpMM1Cut",
	300 : "SpMM1Cut",
	301 : "SpMM1Cut",
	302 : "SpMM1Cut",
	303 : "SpMM1Cut",
	304 : "SpMM1Cut",
	305 : "SpMM1Cut",
	306 : "SpMM1Cut",
	307 : "SpMM1Cut",
	308 : "SpMM1Cut",
	309 : "SpMM1Cut",
	310 : "SpMM1Cut",
	311 : "SpMM1Cut",
	312 : "SpMM1Cut",
	313 : "SpMM1Cut",
	314 : "SpMM1Cut",
	315 : "SpMM1Cut",
	316 : "SpMM1Cut",
	317 : "SpMM1Cut",
	318 : "SpMM1Cut",
	319 : "SpMM1Cut",
	320 : "SpMM1Cut",
	321 : "SpMM1Cut",
	322 : "SpMM1Cut",
	323 : "SpMM1Cut",
	324 : "SpMM1Cut",
	325 : "SpMM1Cut",
	326 : "SpMM1Cut",
	327 : "SpMM1Cut",
	328 : "SpMM1Cut",
	329 : "SpMM1Cut",
	330 : "SpMM1Cut",
	331 : "SpMM1Cut",
	332 : "SpMM1Cut",
	333 : "SpMM1Cut",
	334 : "SpMM1Cut",
	335 : "SpMM1Cut",
	336 : "SpMM1Cut",
	337 : "SpMM1Cut",
	338 : "SpMM1Cut",
	339 : "SpMM1Cut",
	340 : "SpMM1Cut",
	341 : "SpMM1Cut",
	342 : "SpMM1Cut",
	343 : "SpMM1Cut",
	344 : "SpMM1Cut",
	345 : "SpMM1Cut",
	346 : "SpMM1Cut",
	347 : "SpMM1Cut",
	348 : "SpMM1Cut",
	349 : "SpMM1Cut",
	350 : "SpMM1Cut",
	351 : "SpMM1Cut",
	352 : "SpMM1Cut",
	353 : "SpMM1Cut",
	354 : "SpMM1Cut",
	355 : "SpMM1Cut",
	356 : "SpMM1Cut",
	357 : "SpMM1Cut",
	358 : "SpMM1Cut",
	359 : "SpMM1Cut",
	360 : "SpMM1Cut",
	361 : "SpMM1Cut",
	362 : "SpMM1Cut",
	363 : "SpMM1Cut",
	426 : "SpMM1Cut",
	427 : "SpMM1Cut",
	474 : "SpMM1Cut",
	595 : "SpMM1Cut",
	596 : "SpMM1Cut",
	597 : "SpMM1Cut",
	598 : "SpMM1Cut",
	599 : "SpMM1Cut",
	600 : "SpMM1Cut",
	601 : "SpMM1Cut",
	602 : "SpMM1Cut",
	603 : "SpMM1Cut",
	604 : "SpMM1Cut",
	605 : "SpMM1Cut",
	606 : "SpMM1Cut",
	607 : "SpMM1Cut",
	608 : "SpMM1Cut",
	609 : "SpMM1Cut",
	610 : "SpMM1Cut",
	611 : "SpMM1Cut",
	612 : "SpMM1Cut",
	613 : "SpMM1Cut",
	614 : "SpMM1Cut",
	615 : "SpMM1Cut",
	616 : "SpMM1Cut",
	617 : "SpMM1Cut",
	618 : "SpMM1Cut",
	619 : "SpMM1Cut",
	620 : "SpMM1Cut",
	670 : "SpMM1Cut",
	671 : "SpMM1Cut",
	672 : "SpMM1Cut",
	673 : "SpMM1Cut",
	674 : "SpMM1Cut",
	675 : "SpMM1Cut",
	676 : "SpMM1Cut",
	680 : "SpMM1Cut",
	723 : "SpMM1Cut",
	724 : "SpMM1Cut",
	725 : "SpMM1Cut",
	726 : "SpMM1Cut",
	727 : "SpMM1Cut",
	728 : "SpMM1Cut",
	729 : "SpMM1Cut",
	730 : "SpMM1Cut",
	731 : "SpMM1Cut",
	732 : "SpMM1Cut",
	733 : "SpMM1Cut",
	734 : "SpMM1Cut",
	735 : "SpMM1Cut",
	736 : "SpMM1Cut",
	737 : "SpMM1Cut"
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
