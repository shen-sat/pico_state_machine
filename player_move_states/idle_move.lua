local idle_move = {
  id = 'idle_move',
  parent = player,
  next_state = function()
    return player_move_states.idle
  end,
  is_end = function(self)
    return false
  end,
  step = function(self)
  end,
  move_parent = function(self)
  end,
  reset = function(self)
  end
}