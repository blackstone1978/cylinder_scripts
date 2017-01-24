return function(page, offset, screen_width, screen_height)
   local percent = offset/page.width
   local fixed = math.abs(percent)

   local side = 0
   if percent > 0 then side = 1 end

   for i, icon in subviews(page) do
      local iconX = icon.x + icon.width/2
      local iconY = icon.y + icon.height/2
      local absX  = iconX + side * (screen_width-2*iconX)
      local pathX = page.width * side
      local pathY = page.height + 7 + icon.height/2
      local angle = math.atan(iconY/absX)
      icon:translate((pathX-iconX) * fixed, (pathY-iconY) * fixed, 0)
      icon:rotate(percent * angle)
      icon:scale(math.sqrt(1-fixed))
   end
end
