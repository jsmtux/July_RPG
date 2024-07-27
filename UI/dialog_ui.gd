class_name DialogUi
extends Control

signal continueRequest
signal alertFinished

var TOTAL_OPTIONS = 4
var cur_selection = 0
var num_options = 0

func show_text(text):
	$text_panel/Label.text = text;
	$text_panel.visible = true;
	await continueRequest
	$text_panel.visible = false;

func show_alert(text):
	$text_panel/Label.text = text;
	$text_panel.visible = true;
	await alertFinished
	$text_panel.visible = false;

func hide_alert():
	alertFinished.emit()

func show_selection(text, selections):
	cur_selection = 0
	$selection_panel/Label.text = text
	$selection_panel/Label.visible = true
	
	num_options = len(selections)
	cur_selection = 1 if num_options > 0 else 0;
	for i in range(1, num_options + 1):
		var sel_node = get_node(str("selection_panel/selection", i))
		sel_node.visible = true;
		sel_node.text = selections[i - 1]
	
	$selection_panel.visible = true;
	await continueRequest
	$selection_panel.visible = false;
	for node in $selection_panel.get_children():
		node.visible = false;
	num_options = 0
	return cur_selection

func update_selected_icon():
	for i in range(1, TOTAL_OPTIONS + 1):
		var sel_node = get_node(str("selection_panel/selection_icon", i))
		sel_node.visible = i == cur_selection;

func _input(event):
	if event.is_action_pressed("action"):
		continueRequest.emit()
	if event.is_action_pressed("forward"):
		if cur_selection > 1:
			cur_selection -= 1
	if event.is_action_pressed("backward"):
		if cur_selection < num_options:
			cur_selection += 1
	update_selected_icon();
