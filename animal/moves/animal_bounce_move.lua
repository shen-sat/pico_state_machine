animal_bounce_move = {
  id = 'animal_bounce_move',
  parent = animal,
  start_x = animal.x,
  start_y = animal.y,
  speed = 3,
  frames = function(self)
    local frames = {
      function()
        self.parent.y = self.start_y - 6
      end,
      function()
        self.parent.y = self.start_y
      end,
      function()
        self.parent.y = self.start_y - 4
      end,
      function()
        self.parent.y = self.start_y
      end,
      function()
        self.parent.y = self.start_y - 2
      end,
      function()
        self.parent.y = self.start_y
      end,
      function()
        self.parent.y = self.start_y - 1
      end,
      function()
        self.parent.y = self.start_y
      end
    }
    
    return frames
  end,
  loop = true
}