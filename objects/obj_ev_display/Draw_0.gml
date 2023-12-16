if !surface_exists(game_surface)
	game_surface = surface_create(224, 144);

surface_set_target(game_surface)
draw_clear_alpha(c_black, 1)



if (global.play_transition != -1) {
	var t = (global.max_play_transition - global.play_transition) / global.max_play_transition
	var move = animcurve_channel_evaluate(move_curve, t)	
	var grow = animcurve_channel_evaluate(grow_curve, t)	
	image_xscale = lerp(scale_x_start, 1, grow)
	image_yscale = lerp(scale_y_start, 1, grow)
	x = xstart - move * 16 - grow * 16
	y = ystart - move * 16 - grow * 16
	
}




function draw_tile_state(i, j, tile_state, preview = false) {
	var tile = tile_state.tile
	tile.draw_function(tile_state, i, j, preview)
}

draw_sprite(base_ui, 0, 0, 8 * 16)

var rodsprite = (global.level.burdens[burden_stackrod]) ? stackrod_sprite : voidrod_sprite
draw_sprite(rodsprite, 1, 16 * 6, 8 * 16)
for (var i = 0; i < array_length(global.level.burdens) - 1; i++) {
	if global.level.burdens[i]
		draw_sprite_part(burdens_sprite, 0, 16 + i * 16, 0, 16, 16, 16 * (8 + i), 8 * 16)	
}


for (var i = 0; i < 9; i++)	{
	for (var j = 0; j < 14; j++) {
		if i != 8 {
			var tile_state = global.level.tiles[i][j]
			draw_tile_state(i, j, tile_state)
		}
	
		if (global.tile_mode)
			draw_set_alpha(0.4)
		var object_state = global.level.objects[i][j]
		draw_tile_state(i, j, object_state)
		if (global.tile_mode)
			draw_set_alpha(1)
	}
}





if (ev_is_mouse_on_me()) {
	var tile_j = floor((mouse_x - x) / (16 * image_xscale))
	var tile_i = floor((mouse_y - y) / (16 * image_yscale))

	if dragging {
		var small_tile_i = drag_box_i
		var small_tile_j = drag_box_j
		
		if (tile_i < drag_box_i) {
			small_tile_i = tile_i
			tile_i = drag_box_i
		}
		if (tile_j < drag_box_j) {
			small_tile_j = tile_j
			tile_j = drag_box_j
		}
		
		draw_sprite_ext(global.selection_sprite, 0, 
			small_tile_j * 16, small_tile_i * 16, 
			tile_j - small_tile_j + 1, tile_i - small_tile_i + 1,
			0, c_white, 1)
	}
	
	else if global.selected_thing == thing_placeable 
	&& held_tile_state.tile != global.editor_object.object_empty {
		draw_set_alpha((dsin(global.editor_time * 3) / 4) + 0.75)
		draw_tile_state(tile_i, tile_j, held_tile_state, true)
		draw_set_alpha(1)
	}
	else if global.selected_thing == thing_multiplaceable {
		draw_set_alpha((dsin(global.editor_time * 3) / 4) + 0.75)
		for (var i = 0; i < array_length(held_tile_array); i++) {
			for (var j = 0; j < array_length(held_tile_array[i]); j++) {
				var tile_state = held_tile_array[i][j]
				if (tile_state.tile == global.editor_object.current_empty_tile)
					continue;
				var new_tile_i = tile_i + i;
				if new_tile_i >= 9
					continue;
				var new_tile_j = tile_j + j
				if new_tile_j >= 14
					continue;
				draw_tile_state(tile_i + i, tile_j + j, tile_state, false)
			}
		}
		draw_set_alpha(1)
	}
}
		
surface_reset_target()

draw_surface_ext(game_surface, x, y, image_xscale, image_yscale, 0, c_white, 1)