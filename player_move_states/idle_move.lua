local idle_move = {
  id = 'idle_move',
  parent = player,
  next = function()
    player:set_move_state('idle')
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