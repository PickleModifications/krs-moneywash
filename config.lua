KRS = {}

KRS.Lang = {
    ["error"] = "Failed minigame!!",
    ["success"] = "Success minigame!!"
}

-- Wash Money Action Check --
KRS.Action = function(amount)
    return lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1.5}})
end

-- Icon --
KRS.Icon = "fas fa-dollar"
-- Label --
KRS.Label = "Wash your money"
-- Item --
KRS.Item = "black_money"
-- Position Npc --
KRS.NpcPosizione = {
    {
     modello = 'g_m_y_lost_02', -- https://docs.fivem.net/docs/game-references/ped-models/ --
     posizione = vector4(636.6909, 2785.6006, 41.0092, 191.0842),
    }
  
}
-- Position Blip Map --
KRS.LocationMoneywashBlip = {
    {
        positionMoneywash = vector3(636.9615, 2784.3293, 42.0124),
        blip = {
            activeWashMoney = true,
            sprite = 500, -- https://docs.fivem.net/docs/game-references/blips/ --
            color = 11,
            size = 0.7,
            name = "Money Wash"
        }
    },
}
