event_inherited()
if selected and window == noone {
	global.selected_placeable_num = -1
	global.selected_thing = -1
	exit
}
global.selected_thing = 2
var ind = global.tile_mode == editor_types.tile ? tile_ind : (global.tile_mode == editor_types.object ? object_ind : secret_ind)
show_debug_message(ind)
global.selected_placeable_num = ind
var tile = global.editor_instance.current_list[ind]
global.display_object.switch_held_tile(new tile_with_state(tile))


if window != noone
	instance_destroy(window)
