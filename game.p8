pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
  player = {
    x = 0,
    y = 0,
    update = function(self)
      local state = player_move_states[self.move_state]
      state:update()
      -- self.move_state:update()
    end,
    draw = function(self)
      local state = player_draw_states[self.draw_state]
      state:draw()
      -- self.draw_state:draw()
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

  current_time = 0
  #include shared.lua

  -- initialize draw states
  #include player_draw_states/create_draw_state.lua
  #include player_draw_states/flash_anim.lua
  #include player_draw_states/idle_anim.lua
  #include player_draw_states/create_player_draw_states.lua
  player_draw_states = create_player_draw_states()

  -- initialize move states
  #include player_move_states/create_nonframe_move_state.lua
  #include player_move_states/create_frame_move_state.lua
  #include player_move_states/idle_move.lua
  #include player_move_states/right_move.lua
  #include player_move_states/alt_right_move.lua
  #include player_move_states/create_player_move_states.lua
  player_move_states = create_player_move_states()

  player:set_move_state('idle')
  player:set_draw_state('idle')
  
  -- set_draw_state(player_draw_states['idle'], player)
end

function _update()
  if btnp(0) then
  elseif btnp(1) then
    player:set_move_state('right')
    player:set_draw_state('flash')
    -- set_move_state(player_move_states.right, player)
    -- set_draw_state(player_draw_states['flash'], player)
  elseif btnp(2) then
  elseif btnp(3) then
  end

  player:update()
  current_time += 1
end



function _draw()
  cls()
  player:draw()
end