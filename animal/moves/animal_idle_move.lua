local animal_idle_move = {
  id = 'animal_idle_move',
  parent = animal,
  next = function()
    animal:set_move_state('idle')
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