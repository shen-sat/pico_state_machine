function create_player_move_states()
	local player_move_states = {}

	player_move_states.idle = create_nonframe_move_state(idle_move)
	player_move_states.right = create_nonframe_move_state(right_move)

	return player_move_states
end

