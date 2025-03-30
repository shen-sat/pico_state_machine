function create_animal_draw_states()
	local animal_draw_states = {}

	animal_draw_states.idle = create_draw_state(animal_idle_anim)

	return animal_draw_states
end