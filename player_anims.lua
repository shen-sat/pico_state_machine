player_anims = {
	flash = {
		parent = player,
		speed = 20,
		frames = {
			function()
			  rectfill(player.x,player.y,player.x + 10,player.y + 10,8)
			end,
			function()
			  rectfill(player.x,player.y,player.x + 10,player.y + 10,7)
			end
		},
		next_state = draw_idle(player),
		loop = true
	}
}