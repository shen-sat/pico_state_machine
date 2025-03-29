function create_nonframe_move_state(move)
	validate_move(move)
	local state = move
	state.update = function(self)
	  self:step()
	  if self:is_end() then
	    self:reset()
	    self.parent.move_state = self:next_state()
	  else
	    self:move_parent()
	  end
	end

	return state
end

function validate_move(move)
	local id = move.id
	assert(id, "a move is missing an id")
	assert(type(move.is_end) == "function", "'is_end' must be a function in "..id)
	assert(type(move.reset) == "function", "'reset' must be a function in "..id)
	assert(move.parent, "missing 'parent' in "..id)
	assert(move.next_state, "missing 'parent' in "..id)
	assert(type(move.move_parent) == "function", "'move_parent' must be a function in "..id)
end