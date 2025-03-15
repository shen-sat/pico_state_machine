local idle_anim = {
  parent = player,
  speed = 1,
  frames = {
    function()
      rectfill(player.x,player.y,player.x + 10,player.y + 10,11)
    end,
  },
  loop = true,
}

player_draw_states.idle = create_draw_state(idle_anim)