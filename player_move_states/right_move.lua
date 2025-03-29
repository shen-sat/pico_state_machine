local right_move = {
  id = 'right_move',
  parent = player,
  timer = 0,
  next_state = function()
    return player_move_states.idle
  end,
  is_end = function(self)
    return (self.timer >= 1)
  end,
  step = function(self)
    self.timer = min(self.timer + 0.05, 1)
  end,
  move_parent = function(self)
    self.parent.x += 1
  end,
  reset = function(self)
    self.timer = 0
  end
}