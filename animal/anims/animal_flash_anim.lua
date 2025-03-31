local animal_flash_anim = {
  id = 'flash_anim',
  parent = animal,
  speed = 10,
  frames = {
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,7)
    end,
    function()
      rectfill(animal.x,animal.y,animal.x + 10,animal.y + 10,8)
    end,
  },
  loop = true,
}