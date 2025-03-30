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