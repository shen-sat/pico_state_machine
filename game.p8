pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init() 

  player = {
    x = 0,
    y = 0,
    update = function(self)
      self.move_state:update()
    end,
    draw = function(self)
      self.draw_state:draw()
    end
  }

  player.move_state = idle(player)
  player.draw_state = draw_idle(player)

  current_time = 0
end

function right(parent)
  local state = {
    speed = 10,
    start_time = current_time,
    x_positions = {0,1,2,3,4,5},
    get_index = function(self, is_prediction)
      local movement_start_time = self.start_time
      time_elapsed = current_time - movement_start_time
      if is_prediction then time_elapsed += 1 end
      -- using flr makes sure we alwways return an integer at regular intervals
      -- Eg self.speed of 3 will return 1,1,1,2,2,2,3,3,3...
      local i = flr(time_elapsed/self.speed) + 1

      return i
    end,
    update = function(self)
      local i = self:get_index()
      parent.x = self.x_positions[i]
      local next_i = self:get_index(true)
      if next_i > #self.x_positions then
        parent.move_state = idle(parent)
      end
    end
  }

  return state
end

function right_v2(parent)
  local state = {
    timer = 0,
    start_x = parent.x,
    mov = 5,
    update = function(self)
      self.timer = min(self.timer + 0.02, 1)
      if self.timer >= 1 then
        parent.move_state = idle(parent)
      else
        local var = self.start_x + (self.timer * self.mov)
        parent.x = var
      end
    end
  }

  return state
end

function idle(parent)
  local state = {
    update = function(self)
      return
    end
  }

  return state
end

function draw_idle(parent)
  local state = {
    draw = function(self)
      rectfill(parent.x,parent.y,parent.x + 10,parent.y + 10,7)
    end
  }

  return state
end

function flash(parent)
  local state = {
    speed = 20,
    start_time = current_time,
    frames = function(self)
      return {
        function()
          rectfill(parent.x,parent.y,parent.x + 10,parent.y + 10,8)
        end 
      }
    end,
    get_index = function(self, is_prediction)
      local movement_start_time = self.start_time
      time_elapsed = current_time - movement_start_time
      if is_prediction then time_elapsed += 1 end
      -- using flr makes sure we alwways return an integer at regular intervals
      -- Eg self.speed of 3 will return 1,1,1,2,2,2,3,3,3...
      local i = flr(time_elapsed/self.speed) + 1

      return i
    end,
    draw = function(self)
      local i = self:get_index()
      self.frames()[i]()
      local next_i = self:get_index(true)
      if next_i > #self.frames() then
        parent.draw_state = draw_idle(parent)
      end
    end
  }

  return state
end

function _update()
  if btnp(0) then
  elseif btnp(1) then
    player.move_state = right(player)
    player.draw_state = flash(player)

  elseif btnp(2) then
  elseif btnp(3) then
  end

  player:update()
  current_time += 1
end



function _draw()
  cls()
  player:draw()
end