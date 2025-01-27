
if image_index == thing_picker {
	if ev_is_picker_hotkey_pressed() && !selected
		event_user(0)
}

if (image_index == thing_plucker || image_index == thing_eraser || image_index == thing_picker)
	selected = (global.selected_thing == image_index)
event_inherited()

if image_index >= 2 and image_index < 5 {
	switch (global.tile_mode) {
		case editor_types.tile: 
			image_index = 2;
			break;
		case editor_types.object: 
			image_index = 3;
			break;
		case editor_types.secret: 
			image_index = 4;
			break;
	}
}

if image_index == 6 && global.erasing != -1 && (!ev_is_mouse_on_me() || !mouse_check_button(mb_left)) {
	global.erasing = -1
	audio_stop_sound(comes_sound)
}

