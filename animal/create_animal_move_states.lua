function create_animal_move_states()
	local animal_move_states = {}

	animal_move_states.idle = create_nonframe_move_state(animal_idle_move)
	animal_move_states.bounce = create_frame_move_state(animal_bounce_move)
	animal_move_states.down = create_nonframe_move_state(animal_down_move)

	return animal_move_states
end