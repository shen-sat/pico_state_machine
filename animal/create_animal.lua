function create_animal()
  animal = {
    x = 50,
    y = 50,
    update = function(self)
      self.move_state:update()
    end,
    draw = function(self)
      self.draw_state:draw()
    end,
    set_move_state = function(self,state_name)
      local state = self.move_states[state_name]
      assert(state, "animal: could not find move state for state_name "..state_name)
      state.start_time = current_time
      self.move_state = state
    end,
    set_draw_state = function(self,state_name)
      local state = self.draw_states[state_name]
      assert(state, "animal: could not find draw state for state_name: "..state_name)
      state.start_time = current_time
      self.draw_state = state
    end
  }

  return animal
end
