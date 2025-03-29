alt_right_move = {
  id = 'alt_right_move',
  parent = player,
  speed = 10,
  frames = {
    {x = 0},
    {x = 1},
    {x = 2},
    {x = 3},
    {x = 4},
    {x = 5},
  },
  loop = true,
  next_state = function()
    return player_move_states.idle
  end
}