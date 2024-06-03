
function ev_leave_level() {
	if (global.playtesting)
		room_goto(asset_get_index("rm_ev_editor"))
	else
		room_goto(asset_get_index("rm_ev_level_select"))
	global.playtesting = false;
}

function ev_clear_level() {
	if (global.level != noone && !global.debug && !global.playtesting) {
		var sha = level_content_sha1(global.level);

		var gotten_crystal = (global.token_check != 0)
		
		var exists = ds_map_exists(global.beaten_levels_map, sha)
		if exists {
			var current = ds_map_find_value(global.beaten_levels_map, sha)
			if current == 2 || (current == 1 && !gotten_crystal) {
				ev_leave_level();
				return;
			}
		}
		
		if gotten_crystal
			ds_map_set(global.beaten_levels_map, sha, 2)
		else 
			ds_map_set(global.beaten_levels_map, sha, 1)
		global.editor_instance.save_beaten_levels();
	}
	ev_leave_level();
}