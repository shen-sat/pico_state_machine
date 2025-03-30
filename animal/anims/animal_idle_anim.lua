local animal_idle_anim = {
  id = 'idle_anim',
  parent = animal,
  speed = 1,
  frames = {
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,11)
    end,
  },
  loop = true,
}