ESX = exports.es_extended:getSharedObject() -- 𝗞𝗥𝗦® --

moneywash = true 

-- OX TARGET 𝗞𝗥𝗦® --
local options = {
    {
        icon = KRS.Icon,
        label = KRS.Label,
        distance = 10.5,
        onSelect = function(data)
       
            if moneywash then
                
                FreezeEntityPosition(PlayerPedId(), true)
                local input = lib.inputDialog('Krs Moneywash', {
                    {type = 'number', label = 'Amount', description = 'black money', icon = 'dollar'},
                    
                    })

                FreezeEntityPosition(PlayerPedId(), false)
                if input and #input > 0 then
                        TriggerServerEvent('krs_lavaggiosoldi', input[1])
                       
                    end       
                end
            end,
        canInteract = function(entity, distance, coords, name, bone)
            return not IsEntityDead(entity)
        end
    }
}

Citizen.CreateThread(function()
    for i = 1, #KRS.NpcPosizione, 1 do
        if not HasModelLoaded(KRS.NpcPosizione[i].modello) then
            RequestModel(KRS.NpcPosizione[i].modello)
            while not HasModelLoaded(KRS.NpcPosizione[i].modello) do
                Citizen.Wait(5)
            end
        end
        npc = CreatePed(4, KRS.NpcPosizione[i].modello, KRS.NpcPosizione[i].posizione, false, true)
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
       
        exports.ox_target:addLocalEntity(npc, options)
     end
end)


CreateThread(function()
    for i = 1, #KRS.LocationMoneywashBlip, 1 do
        local KRS = KRS.LocationMoneywashBlip[i]

        if KRS.blip.activeWashMoney then 
			local blip = AddBlipForCoord(KRS.positionMoneywash.x, KRS.positionMoneywash.y, KRS.positionMoneywash.z)
			SetBlipSprite (blip, KRS.blip.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, KRS.blip.size)
			SetBlipColour (blip, KRS.blip.color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(KRS.blip.name)
			EndTextCommandSetBlipName(blip)
        end
    end
end)