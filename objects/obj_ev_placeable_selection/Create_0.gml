event_inherited();

function update() {
	if !direct {
		tile_ind = global.player_tiles[num]
		object_ind = global.player_objects[num]
		secret_ind = global.player_secrets[num]
	}
	else {
		tile_ind = num;
		object_ind = num;
		secret_ind = num;
	}
}
update()

x += 8
y += 8

