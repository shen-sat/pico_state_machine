function set_move_state(state, parent)
	state.start_time = current_time
	parent.move_state = state
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

function create_frame_move_state(move)
	validate_frame_move(move)

	local state = {
		id = move.id,
		start_time = 0,
		parent = player,
		speed = move.speed,
		frames = move.frames,
		loop = move.loop,
		next = move.next,
		get_index = function(self, is_prediction)
		  local start_time = self.start_time
		  time_elapsed = current_time - start_time
		  if is_prediction then time_elapsed += 1 end
		  -- using flr makes sure we alwways return an integer at regular intervals
		  -- Eg self.speed of 3 will return 1,1,1,2,2,2,3,3,3...
		  local i = flr(time_elapsed/self.speed) + 1

		  return i
		end,
		update = function(self)
		  local i = self:get_index()

		  local point
		  if self.loop then
		    point = self.frames[(i % #self.frames) + 1]
		  else
		    point = self.frames[i]
		  end

		  if point.x then
		    self.parent.x = point.x
		  end
		  if point.y then
		    self.parent.y = point.y
		  end

		  if not self.loop then
		    local next_i = self:get_index(true)
		    if next_i > #self.frames then
		      self.next()
		    end
		  end
		end
	}

	return state
end

function create_nonframe_move_state(move)
	validate_nonframe_move(move)

	local state = {
		id = move.id,
		is_end = move.is_end,
		reset = move.reset,
		parent = move.parent,
		next = move.next,
		move_parent = move.move_parent,
		step = move.step,
		update = function(self)
		  self:step()
		  if self:is_end() then
		    self:reset()
		    self.next()
		  else
		    self:move_parent()
		  end
		end
	}

	return state
end