CONFIG = {
  PRIMARY = 9016,
  SECONDARY = {8894, 8895, 8896, 8897, 8898, 8899}
}
  
Module.New("USING ITEM ON OTHER ITEM.", function(moduleObject)
local PRIMARY, SECONDARY, SPOTS = nil, nil, {}
  for i = 0, 15 do
  local cont = Container.New(i)
    if not table.contains({"The", "Demonic", "Dead", "Slain", "Dissolved", "Remains", "Elemental"}, string.match(cont:Name(), "%a+")) then
      for SPOT = cont:ItemCount() - 1, 0, -1 do
      local tmp = cont:GetItemData(SPOT)
        if (tmp.id == CONFIG.PRIMARY) then
          PRIMARY = cont
          SPOTS[1] = SPOT
        elseif (table.contains(CONFIG.SECONDARY, tmp.id)) then
          SECONDARY = cont
          SPOTS[2] = SPOT
        end
      end
    end
  end
  if (PRIMARY ~= nil and SECONDARY ~= nil) then
    PRIMARY:UseItemWithContainerItem(SPOTS[1], SECONDARY:Index(), SPOTS[2])
  end
moduleObject:Delay(1000)
end)