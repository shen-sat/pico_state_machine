local animal_down_move = {
  id = 'animal_down_move',
  parent = animal,
  counter = 0,
  next = function()
    animal:set_move_state('idle')
  end,
  is_end = function(self)
    return (self.counter > 10)
  end,
  step = function(self)
    self.counter += 1
  end,
  move_parent = function(self)
    self.parent.y += 1
  end,
  reset = function(self)
    self.counter = 0
  end
}