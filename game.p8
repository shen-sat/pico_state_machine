pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
  current_time = 0
  -- shared
  #include shared.lua

  --player
  #include player/create_player.lua
  player = create_player()

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