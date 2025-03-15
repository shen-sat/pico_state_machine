function right_v3(parent)
  local state = {
    timer = 0,
    start_x = function()
      return parent.x
    end,
    mov = 1,
    update = function(self)
      self:step()
      if self:is_end() then
        self:reset()
        parent.move_state = self.next_state
      else
        self:move_parent()
      end
    end,
    is_end = function(self)
      return (self.timer >= 1)
    end,
    step = function(self)
      self.timer = min(self.timer + 0.05, 1)
    end,
    move_parent = function(self)
      parent.x += 1
    end,
    reset = function(self)
      self.timer = 0
    end,
    next_state = idle(parent)
  }

  return state
end

-- 