local animal_right_move = {
  id = 'animal_right_move',
  parent = animal,
  counter = 0,
  next = function()
    animal:set_move_state('bounce')
    animal:set_draw_state('pink')
  end,
  is_end = function(self)
    return (self.counter > 10)
  end,
  step = function(self)
    self.counter += 1
  end,
  move_parent = function(self)
    self.parent.x += 1
  end,
  reset = function(self)
    self.counter = 0
  end
}