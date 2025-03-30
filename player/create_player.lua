function create_player()
  player = {
    x = 0,
    y = 0,
    update = function(self)
      local state = player_move_states[self.move_state]
      state:update()
    end,
    draw = function(self)
      local state = player_draw_states[self.draw_state]
      state:draw()
    end,
    set_move_state = function(self,state_name)
      local state = player_move_states[state_name]
      assert(state, "could not find move state for state_name "..state_name)
      state.start_time = current_time
      self.move_state = state_name
    end,
    set_draw_state = function(self,state_name)
      local state = player_draw_states[state_name]
      assert(state, "could not find draw state for state_name "..state_name)
      state.start_time = current_time
      self.draw_state = state_name
    end
  }

  return player
end
