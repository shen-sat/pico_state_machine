function create_draw_state(anim)
	local state = {
	  speed = anim.speed,
	  frames = function(self)
	    return anim.frames
	  end,
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
	  	if anim.loop then
	  		self.frames()[(i % #anim.frames) + 1]()
	  	else
	  		self.frames()[i]()
	  		local next_i = self:get_index(true)
	  		if next_i > #self.frames() then
	  		  anim.parent.draw_state = anim.next_state
	  		end
	  	end
	  end
	}

	return state
end

function set_draw_state(state, parent)
	state.start_time = current_time
	parent.draw_state = state
end