local animal_change_anim = {
  id = 'change_anim',
  parent = animal,
  speed = 5,
  frames = {
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,11)
    end,
    function()
      circfill(animal.x,animal.y)
    end,
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,11)
    end,
    function()
      circfill(animal.x,animal.y)
    end,
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,11)
    end,
    function()
      circfill(animal.x,animal.y)
    end
  },
  next = function()
    animal:set_draw_state('idle')
  end,
  loop = false,
}