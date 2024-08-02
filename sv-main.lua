local inventory = exports.ox_inventory:Inventory()
local players = {}


RegisterNetEvent('cb_kamiony:server:payout:losSantos')
AddEventHandler('cb_kamiony:server:payout:losSantos', function ()
    local finalycoords = Config.Depo.LS.returnVehCoords
    local pos = GetEntityCoords(GetPlayerPed(source))
    local distance = #(vec3(pos.x,pos.y,pos.z) - vector3(finalycoords.x, finalycoords.y,finalycoords.z))

    if distance == nil or distance > 2 then
        DropPlayer(source, "Cheating tried to teleport")
        return
    end

    inventory.AddItem(source, "money", Config.Price.losSantos)
end)

RegisterNetEvent('cb_kamiony:server:payout:paleto')
AddEventHandler('cb_kamiony:server:payout:paleto', function ()
    local finalycoords = Config.Depo.Paleto.returnVehCoords
    local pos = GetEntityCoords(GetPlayerPed(source))
    local distance = #(vec3(pos.x,pos.y,pos.z) - vector3(finalycoords.x, finalycoords.y,finalycoords.z))

    
    if distance == nil or distance > 2 then
        DropPlayer(source, "Cheating tried to teleport")
        return
    end

    inventory.AddItem(source, "money", Config.Price.paleto)
end)

RegisterNetEvent('cb_kamiony:server:payout:sandy')
AddEventHandler('cb_kamiony:server:payout:sandy', function ()
    local finalycoords = Config.Depo.Sandy.returnVehCoords
    local pos = GetEntityCoords(GetPlayerPed(source))
    local distance = #(vec3(pos.x,pos.y,pos.z) - vector3(finalycoords.x, finalycoords.y,finalycoords.z))

    
    if distance == nil or distance > 2 then
        DropPlayer(source, "Cheating tried to teleport")
        return
    end

    inventory.AddItem(source, "money", Config.Price.sandy)
end)



