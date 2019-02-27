Module.New('utitotempo', function()
    local targets = Self.GetTargets(1)
    if #targets >= 1 then -- If more or equal to 3 monsters on screen (can be changed, just replace the 3 with the amount of monsters)
        Self.Cast('utevo gran res dru') -- Casts utito tempo
                wait(120000) -- waits 10 seconds before checking again
        else -- if monsters isnt more or equal to three
        wait(1000) -- wait 1 second before checking again
    end
end)