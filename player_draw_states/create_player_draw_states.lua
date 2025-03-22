function create_player_draw_states()
	local player_draw_states = {}

	player_draw_states.flash = create_draw_state(flash_anim)
	player_draw_states.idle = create_draw_state(idle_anim)

	return player_draw_states
end

