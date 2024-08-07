extends Control

@export var levels_folder: String = "res://Script/Levels/"
@export var button_scene = preload("res://Scenes/level_button.tscn")
const make_new_lvl_button_scene = preload("res://Scenes/make_new_lvl_button.tscn")
var file_to_delete = ""
var button_instance_to_free = null

signal switch_screens

# Called when the node enters the scene tree for the first time.
func _ready():
	_scan_levels_folder()
	var make_new_lvl_instance = make_new_lvl_button_scene.instantiate()
	make_new_lvl_instance.connect("pressed", Callable(self, "open_editor"))
	$Panel/ScrollContainer/VBoxContainer.add_child(make_new_lvl_instance)

func _scan_levels_folder():
	var dir = DirAccess.open(levels_folder)
	var dev_files = []
	var normal_files = []
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".gd"):
				# Sorting the levels so that dev levels stay on top
				if file_name.begins_with("dev_"):
					dev_files.append(file_name)
				else:
					normal_files.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
		
		var all_files = dev_files + normal_files
		if Main.in_editor:
			for file in normal_files:
				if file != "Untitled.gd":
					var file_path = levels_folder + file
					_add_level_button(file_path)
		else:
			for file in all_files:
				var file_path = levels_folder + file
				if not file.begins_with("dev_"):
					if is_level_completed(file_path):
						_add_level_button(file_path)
				else:
					_add_level_button(file_path)
		
	else:
		print("Failed to open directory: " + levels_folder)

func _get_level_bgm(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		while not file.eof_reached():
			var line = file.get_line().strip_edges()
			if line.begins_with("var bgm = "):
				return line.lstrip("var bgm = ").replace("\"", "")

func is_level_completed(file_path: String) -> bool:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var line
		while not file.eof_reached():
			line = file.get_line().strip_edges()
			if line.begins_with("var is_completed"):
				return line == "var is_completed = true"
		file.close()
	return false
	
func _add_level_button(file_path: String):
	#play_click_sfx()
	var button_instance = button_scene.instantiate()
	var name_label = button_instance.get_node("level_button/VBoxContainer/LevelName")
	var last_edited_label = button_instance.get_node("level_button/VBoxContainer/LastEdited")
	name_label.text = file_path.get_file().get_basename()
	last_edited_label.text = "Last edited: " + _get_file_last_modified(file_path)
	var lvl_name = name_label.text
	
	button_instance.find_child("DeleteButton").connect("pressed", Callable(self, "_on_delete_lvl_button_pressed").bind(button_instance, file_path))
	if lvl_name.begins_with("dev_"):
		button_instance.find_child("DeleteButton").visible = false
	#if not is_level_completed(file_path):
	#	button_instance.find_child("ShareButton").visible = false
	button_instance.connect("pressed", Callable(self, "_on_level_button_pressed").bind(file_path))
	$Panel/ScrollContainer/VBoxContainer.add_child(button_instance)
	

func check_level_saved(file_path: String) -> bool:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var line
		while not file.eof_reached():
			line = file.get_line()
			if line.begins_with("var is_saved"):
				return line == "var is_saved = true"
		return false	
	else:
		print("Error: Could not open file: ", file_path)
		return false

func _get_file_last_modified(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var mod_time = FileAccess.get_modified_time(file_path)
		file.close()
		var date = Time.get_datetime_string_from_unix_time(mod_time)
		return date
	return "Unknown"

func _on_level_button_pressed(file_path: String):
	play_click_sfx()
	Main.curr_level_bgm = _get_level_bgm(file_path)
	Main.LEVEL_SCRIPT = file_path
	emit_signal("switch_screens")

func _on_delete_lvl_button_pressed(button_instance, file_path: String):
	play_click_sfx()
	file_to_delete = file_path
	button_instance_to_free = button_instance
	$WarningPanel.visible = true
	$WarningPanel/Content.text = "Are you sure you want to delete {0}? (this action cannot be undone)".format([file_path.get_file().get_basename()])

func open_editor():
	play_click_sfx()
	Main.in_editor = true
	get_tree().change_scene_to_file("res://Scenes/editor.tscn")

func play_click_sfx():
	$ClickSFX.play()
	
func _on_delete_pressed():
	play_click_sfx()
	if file_to_delete != "":
		
		if FileAccess.file_exists(file_to_delete):
			var err = DirAccess.remove_absolute(file_to_delete)
			if err == OK:
				print("File: ", file_to_delete, "deleted successfully")
				button_instance_to_free.queue_free()
			else:
				print("Error deleting file: ", err)
		else:
			print("File does not exist")
		
		if Main.CURR_EDITOR_LEVEL == file_to_delete:
			Main.CURR_EDITOR_LEVEL = ""
		if Main.CURR_EDITOR_LEVEL_COMPLETED == file_to_delete:
			Main.CURR_EDITOR_LEVEL_COMPLETED = ""
			
		#reset the vars on top
		file_to_delete = ""
		button_instance_to_free = null
		$WarningPanel.visible = false

func _on_cancel_pressed():
	play_click_sfx()
	$WarningPanel.visible = false
