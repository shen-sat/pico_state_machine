local flash_anim = {
	id = 'flash_anim',
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
	next = function()
		player:set_draw_state('idle')
	end,
	loop = true
}