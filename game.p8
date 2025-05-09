pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
  current_time = 0
  -- shared
  #include shared/draw.lua
  #include shared/move.lua

  -------------------------------------- animal
  #include animal/create_animal.lua
  animal = create_animal()
  -- initialize draw states
  #include animal/anims/animal_idle_anim.lua
  #include animal/anims/animal_flash_anim.lua
  #include animal/anims/animal_change_anim.lua
  #include animal/anims/animal_pink_anim.lua
  #include animal/create_animal_draw_states.lua
  animal.draw_states = create_animal_draw_states()
  animal:set_draw_state('idle')
  -- initialize animal move states
  #include animal/moves/animal_idle_move.lua
  #include animal/moves/animal_bounce_move.lua
  #include animal/moves/animal_down_move.lua
  #include animal/moves/animal_right_move.lua
  #include animal/create_animal_move_states.lua
  animal.move_states = create_animal_move_states()
  animal:set_move_state('idle')

  --player
  -- #include player/create_player.lua
  -- player = create_player()

  -- initialize draw states
-- #include player_draw_states/flash_anim.lua
-- #include player_draw_states/idle_anim.lua
-- #include player_draw_states/create_player_draw_states.lua

-- -- initialize move states
-- #include player_move_states/idle_move.lua
-- #include player_move_states/right_move.lua
-- #include player_move_states/alt_right_move.lua
-- #include player_move_states/create_player_move_states.lua

-- player.draw_states = create_player_draw_states()
-- player.move_states = create_player_move_states()

-- player:set_move_state('idle')
-- player:set_draw_state('idle')
end

function _update()
  if btnp(0) then
  elseif btnp(1) then
    animal:set_move_state('right')
  elseif btnp(2) then
    animal:set_move_state('bounce')
    animal:set_draw_state('flash')
  elseif btnp(3) then
    animal:set_move_state('down')
    animal:set_draw_state('change')
  end

  -- player:update()
  animal:update()
  current_time += 1
end



function _draw()
  cls()
  -- player:draw()
  animal:draw()
end