update()
var ind = global.tile_mode == editor_types.tile ? tile_ind : (global.tile_mode == editor_types.object ? object_ind : secret_ind)
show_debug_message(secret_ind)
var tile = global.editor_instance.current_list[ind]
selected = (global.selected_thing == 2 && tile == global.display_object.held_tile_state.tile)

event_inherited()

if keyboard_check_pressed(ord(string(num + 1))) && !selected && global.mouse_layer == 0
	event_user(0)	
