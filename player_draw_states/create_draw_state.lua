function create_draw_state(anim)
	validate_anim(anim)
	local state = {
		start_time = 0,
	  parent = anim.parent,
	  speed = anim.speed,
	  loop = anim.loop,
	  frames = anim.frames,
	  next = anim.next,
	  get_index = function(self, is_prediction)
	    local movement_start_time = self.start_time
	    time_elapsed = current_time - movement_start_time
	    if is_prediction then time_elapsed += 1 end
	    -- using flr makes sure we alwways return an integer at regular intervals
	    -- Eg self.speed of 3 will return 1,1,1,2,2,2,3,3,3...
	    local i = flr(time_elapsed/self.speed) + 1

	    return i
	  end,
	  draw = function(self)
	  	local i = self:get_index()
	  	if self.loop then
	  		self.frames[(i % #self.frames) + 1]()
	  	else
	  		self.frames[i]()
	  		local next_i = self:get_index(true)
	  		if next_i > #self.frames then
	  			self.next()
	  		end
	  	end
	  end
	}

	return state
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