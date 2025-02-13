event_inherited()
tile_ind = global.player_tiles[num]
object_ind = global.player_objects[num]
secret_ind = global.player_secrets[num]

if selected { 
	depth = layer_get_depth("WindowElements") - 1;
	if mouse_check_button_released(mb_left)	 {
		selected = false;
		var inst = instance_position(mouse_x, mouse_y, asset_get_index("obj_ev_placeable_selection"))
		if !instance_exists(inst) || inst.layer_num != layer_num
			exit
			
		switch (global.tile_mode) {
			case editor_types.tile:
				global.player_tiles[num] = inst.num;
				break;
			case editor_types.object:
				global.player_objects[num] = inst.num;
				break;
			case editor_types.secret:
				global.player_secrets[num] = inst.num;
				break;
		}
		
		audio_play_sound(asset_get_index("snd_ev_select_favorite"), 10, false)
	}	
}
else
	layer = layer_get_id("WindowElements")