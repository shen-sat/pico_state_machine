alt_right_move = {
  id = 'alt_right_move',
  parent = player,
  speed = 3,
  frames = {
    {x = 6},
    {x = -6},
    {x = 4},
    {x = -4},
    {x = 1},
    {x = -1},
  },
  loop = false,
  next_state = function()
    return player_move_states.idle
  end
}