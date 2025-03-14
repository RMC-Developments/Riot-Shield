local shieldActive = false
local shieldProp = nil

-- Function to activate/deactivate the shield when the item is used
RegisterNetEvent('qb-shield:activate', function()
    local playerPed = PlayerPedId()

    if shieldActive then
        -- If the shield is already active, deactivate it (remove the shield)
        RemoveShield()
    else
        -- If the shield is not active, activate it (equip the shield)
        shieldActive = true

        -- Load the prop model (if not already loaded)
        RequestModel(Config.Shield.model)
        while not HasModelLoaded(Config.Shield.model) do
            Wait(500)
        end

        -- Attach the shield to the player
        local coords = GetEntityCoords(playerPed)
        shieldProp = CreateObjectNoOffset(Config.Shield.model, coords.x, coords.y, coords.z, true, true, false)

        -- Attach the shield to the player's left hand (left hand bone index)
        local boneIndex = GetPedBoneIndex(playerPed, 18905)  -- Left hand bone index

        -- Adjust the offsets to position the shield properly
        local offsetX = 0.3  -- Adjust this value to move the shield further outward
        local offsetY = 0.0  -- Keep this value to prevent the shield from shifting sideways
        local offsetZ = 0.1  -- Move the shield slightly up (adjust as needed)

        -- Adjust the rotation of the shield (if needed, to face the correct direction)
        local rotX = 270.0  -- No rotation around the X axis
        local rotY = 120.0  -- Rotate 90 degrees on the Y axis to face the correct direction
        local rotZ = 0.0  -- No rotation around the Z axis

        -- Attach the shield with the new offsets
        AttachEntityToEntity(shieldProp, playerPed, boneIndex, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, true, true, false, true, 1, true)

        -- Load and play the custom holding animation (missfam4 - base)
        RequestAnimDict('missfam4')  -- Request the 'missfam4' animation dictionary
        while not HasAnimDictLoaded('missfam4') do
            Wait(500)  -- Wait for the animation dictionary to load
        end

        -- Play the holding shield animation (base) indefinitely
        TaskPlayAnim(playerPed, 'missfam4', 'base', 8.0, 8.0, -1, 49, 0, false, false, false)

        -- Show notification
        TriggerEvent('QBCore:Notify', Config.Notifications.shieldActivated, 'success')

        -- Set a timer for the shield's duration
        Citizen.SetTimeout(Config.Shield.duration, function()
            -- Deactivate the shield after the duration
            RemoveShield()
        end)
    end
end)

-- Function to remove the shield
function RemoveShield()
    local playerPed = PlayerPedId()

    if shieldProp then
        -- Detach the shield prop and remove it
        DetachEntity(shieldProp, true, false)
        DeleteObject(shieldProp)
        shieldProp = nil
    end

    -- Stop shield holding animation
    ClearPedTasks(playerPed)

    -- Show notification
    TriggerEvent('QBCore:Notify', Config.Notifications.shieldDeactivated, 'error')

    -- Reset shield status
    shieldActive = false
end

-- Prevent the shield animation from being overwritten by other animations (like drawing a gun)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()

        if shieldActive then
            -- Check if the player is currently playing the shield animation using GetEntityAnimCurrentTime
            local animTime = GetEntityAnimCurrentTime(playerPed, 'missfam4', 'base')

            -- If the animation has ended or is being interrupted, restart the animation
            if animTime == 1.0 or animTime == 0.0 then
                -- Restart the shield holding animation if it's not already playing
                TaskPlayAnim(playerPed, 'missfam4', 'base', 8.0, 8.0, -1, 49, 0, false, false, false)
            end
        end
    end
end)

-- Check if the player is taking damage while the shield is active
AddEventHandler('playerDamage', function(amount)
    if shieldActive then
        amount = amount * Config.Shield.damageReduction -- Reduce damage by the configured value
    end
    -- Apply the damage normally
end)
