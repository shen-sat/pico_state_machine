alt_right_move = {
  id = 'alt_right_move',
  parent = player,
  speed = 3,
  frames = {
    {x = 6},
    {x = 0},
    {x = 4},
    {x = 0},
    {x = 1},
    {x = 0},
  },
  loop = true,
  next = function()
    player:set_move_state('idle')
  end
}