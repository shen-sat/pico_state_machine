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