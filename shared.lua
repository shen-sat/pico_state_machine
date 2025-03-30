-- function create_draw_state(anim)
-- 	-- todo: add validations for anim attributes eg .speed, .next_state (if not looping), etc
-- 	local state = {
-- 	  speed = anim.speed,
-- 	  frames = function(self)
-- 	    return anim.frames
-- 	  end,
-- 	  get_index = function(self, is_prediction)
-- 	    local movement_start_time = self.start_time
-- 	    time_elapsed = current_time - movement_start_time
-- 	    if is_prediction then time_elapsed += 1 end
-- 	    -- using flr makes sure we alwways return an integer at regular intervals
-- 	    -- Eg self.speed of 3 will return 1,1,1,2,2,2,3,3,3...
-- 	    local i = flr(time_elapsed/self.speed) + 1

-- 	    return i
-- 	  end,
-- 	  draw = function(self)
-- 	  	local i = self:get_index()
-- 	  	if anim.loop then
-- 	  		self.frames()[(i % #anim.frames) + 1]()
-- 	  	else
-- 	  		self.frames()[i]()
-- 	  		local next_i = self:get_index(true)
-- 	  		if next_i > #self.frames() then
-- 	  			local state = player_draw_states['idle']
-- 	  			state.start_time = current_time
-- 	  			parent.draw_state = state

-- 	  		  -- set_draw_state(anim.next_state, anim.parent)
-- 	  		end
-- 	  	end
-- 	  end
-- 	}

-- 	return state
-- end

-- function set_draw_state(state_name, parent)
-- 	local state = player_draw_states[state_name]
-- 	state.start_time = current_time
-- 	parent.draw_state = state
-- end

function set_draw_state(state, parent)
	state.start_time = current_time
	parent.draw_state = state
end

function set_move_state(state, parent)
	state.start_time = current_time
	parent.move_state = state
end

function validate_anim(anim)
	local id = anim.id
	assert(id, "an anim is missing an id")
	assert(anim.speed, "missing 'speed' in "..id)
	assert(anim.frames, "missing 'frames' in "..id)
	assert(#anim.frames > 0, "less than 1 frame in "..id)
	assert(not(anim.loop == nil), "missing 'loop' in "..id)
	if not anim.loop then
		assert(type(anim.next) == "function", "'next' must be a function in "..id)
	end
	assert(anim.parent, "missing 'parent' in "..id)
end

function validate_nonframe_move(move)
	local id = move.id
	assert(id, "a move is missing an id")
	assert(type(move.step) == "function", "'step' must be a function in "..id)
	assert(type(move.is_end) == "function", "'is_end' must be a function in "..id)
	assert(type(move.reset) == "function", "'reset' must be a function in "..id)
	assert(move.parent, "missing 'parent' in "..id)
	assert(type(move.next) == "function", "'next' must be a function in "..id)
	assert(type(move.move_parent) == "function", "'move_parent' must be a function in "..id)
end

function validate_frame_move(move)
	local id = move.id
	assert(id, "a move is missing an id")
	assert(move.parent, "missing 'parent' in "..id)
	assert(move.speed, "missing 'speed' in "..id)
	assert(move.frames, "missing 'frames' in "..id)
	assert(#move.frames > 0, "less than 1 frame in "..id)
	assert(not(move.loop == nil), "missing 'loop' in "..id)
	if not move.loop then
		assert(type(move.next) == "function", "'next' must be a function in "..id)
	end
end