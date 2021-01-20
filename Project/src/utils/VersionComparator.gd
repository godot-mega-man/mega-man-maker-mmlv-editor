# VersionComparator

extends Reference

class_name VersionComparator

"""
	A comparator class to compare versions and conclude whether it's newer or
	older version. The idea of this class is to read the first digit, than,
	the second, after that, the third, and compare both versions numerically. 
"""

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const OLDER = -1
const UP_TO_DATE = 0
const NEWER = 1

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

# Method to compare version numbers.
# Returns 1 if v1 > v2
# Returns -1 if v1 < v2
# Returns 0 if v1 == v2
#
# Note that version strings that are not made up of digits will be ignored, so
# passing parameter "1.3a" will be converted to 1.3
#
# Ex: compare("1.2", "1.3") # Returns 1
# Ex: compare("1.0.1", "1.1") # Returns 1
# Ex: compare("1.5", "0.9.1.2") # Returns -1
# Ex: compare("2.0.0", "2.0") # Returns 0
# Ex: compare("", "1.0") # Returns 1
# Ex: compare("3.0", "") # Returns -1
# Ex: compare("", "") # Returns 0
# Ex: compare("4.0a", "4.0b") # Returns 0
static func compare(v1 : String, v2 : String) -> int:
	var split_v1 : PoolStringArray = v1.split(".")
	var split_v2 : PoolStringArray = v2.split(".")
	
	for i in max(split_v1.size(), split_v2.size()):
		var num_v1 : int
		var num_v2 : int
		
		if i >= split_v1.size():
			num_v1 = 0
		else:
			num_v1 = int(split_v1[i])
		if i >= split_v2.size():
			num_v2 = 0
		else:
			num_v2 = int(split_v2[i])
		
		if num_v1 > num_v2:
			return NEWER
		if num_v1 < num_v2:
			return OLDER
	
	return UP_TO_DATE
