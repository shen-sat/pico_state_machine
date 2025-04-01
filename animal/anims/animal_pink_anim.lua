local animal_pink_anim = {
  id = 'pink_anim',
  parent = animal,
  speed = 100,
  frames = {
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,14)
    end
  },
  loop = true,
}