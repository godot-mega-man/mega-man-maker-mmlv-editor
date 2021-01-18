# HelpListPopupDialog

extends AcceptDialog

"""
	Enter desc here.
"""

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var content_vbox = $MarginContainer/ScrollContainer/ContentVBox

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_create_ui()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _create_ui():
	for i in DataHints.LIST.size():
		_create_hint(DataHints.LIST[i], i+1)
		_create_separator()

func _create_hint(hint : String, number : int):
	var hbox = HBoxContainer.new()
	content_vbox.add_child(hbox)
	hbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	var label_number = Label.new()
	hbox.add_child(label_number)
	label_number.text = "%s." % number
	
	var label_hint = Label.new()
	hbox.add_child(label_hint)
	label_hint.autowrap = true
	label_hint.text = hint
	label_hint.size_flags_horizontal = Control.SIZE_EXPAND_FILL

func _create_separator():
	var sep = HSeparator.new()
	content_vbox.add_child(sep)
