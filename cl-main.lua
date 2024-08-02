local target = exports.ox_target 
local inventory = exports.ox_inventory

local npc_one = {}
local returnvehNPC_one = {}

local vehicle = nil
local trailer = nil 




CreateThread(function ()
        local model = "a_m_m_farmer_01"
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(500)
        end
        local ped = CreatePed(5, model, vector4(-778.9189, -2635.1577, 13.9446, 149.1856), false, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedDiesWhenInjured(ped, false)
        SetPedCanRagdollFromPlayerImpact(ped, false)
        SetPedCanRagdoll(ped, false)
        SetEntityInvincible(ped, true)
        table.insert(npc_one, ped)
    target:addLocalEntity(npc_one, {
        name = "startDepo",
        icon = "fa-solid fa-truck",
        label = "Zeptat se na praci",
        onSelect = function ()
            lib.registerContext({
                id = 'depa',
                title = 'Vzít zakazku :',
                options = {
                    {
                        title = "Los Santos",
                        icon = "fa-solid fa-truck",
                        metadata = {
                            {label = "dostanete", value = ""..Config.Price.losSantos.."$"}
                        },
                        onSelect = function ()
                            local randomTrailer = RandomTrailer(Config.TrailerSpawnCode)
                            local car = GetHashKey("hauler")
                            RequestModel(car)
                            while not HasModelLoaded(car) do 
                                Wait(500)
                            end
                            vehicle = CreateVehicle(car, Config.SpawnVehicle.x, Config.SpawnVehicle.y, Config.SpawnVehicle.z, Config.SpawnVehicle.w, true, true)
                            RequestModel(randomTrailer)
                            while not HasModelLoaded(randomTrailer) do 
                                Wait(500)
                            end
                            trailer = CreateVehicle(randomTrailer, Config.SpawnTrailer.x, Config.SpawnTrailer.y, Config.SpawnTrailer.z, Config.SpawnTrailer.w, true, true)
                            -- navigace
                            lib.notify({
                                title = "Kamionak",
                                icon = "fa-solid fa-truck",
                                description = "Navigace nastavena",
                                type = "sucess"
                            })
                            SetNewWaypoint(Config.Depo.LS.coords.x, Config.Depo.LS.coords.y)

                            CreateThread(function ()
                                local model = "a_m_m_farmer_01"
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(500)
                                end
                                local ped = CreatePed(5, model, Config.Depo.LS.returnVehCoords.x,Config.Depo.LS.returnVehCoords.y,Config.Depo.LS.returnVehCoords.z,Config.Depo.LS.returnVehCoords.w, false, true)
                                SetEntityAsMissionEntity(ped, true, true)
                                SetBlockingOfNonTemporaryEvents(ped, true)
                                SetPedDiesWhenInjured(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, false)
                                SetPedCanRagdoll(ped, false)
                                SetEntityInvincible(ped, true)
                                table.insert(returnvehNPC_one, ped)

                                target:addLocalEntity(returnvehNPC_one, {
                                    name = "vraceni_vozidla",
                                    icon = "fa-solid fa-truck",
                                    label = "vratit vozidlo",
                                    onSelect = function ()
                                        if vehicle then
                                            if trailer then
                                                if DoesEntityExist(vehicle) then
                                                    DeleteEntity(vehicle)
                                                end
                                            end
                                            vehicle = nil
                                            trailer = nil 
                                            TriggerServerEvent('cb_kamiony:server:payout:losSantos')
                                        end
                                    end
                                })
                            end)
                        end
                    },
                    {
                        title = "Paleto",
                        icon = "fa-solid fa-truck",
                        metadata = {
                            {label = "dostanete", value = ""..Config.Price.paleto.."$"}
                        },
                        onSelect = function ()
                            local randomTrailer = RandomTrailer(Config.TrailerSpawnCode)
                            local car = GetHashKey("hauler")
                            RequestModel(car)
                            while not HasModelLoaded(car) do 
                                Wait(500)
                            end
                            vehicle = CreateVehicle(car, Config.SpawnVehicle.x, Config.SpawnVehicle.y, Config.SpawnVehicle.z, Config.SpawnVehicle.w, true, true)
                            RequestModel(randomTrailer)
                            while not HasModelLoaded(randomTrailer) do 
                                Wait(500)
                            end
                            trailer = CreateVehicle(randomTrailer, Config.SpawnTrailer.x, Config.SpawnTrailer.y, Config.SpawnTrailer.z, Config.SpawnTrailer.w, true, true)
                            -- navigace
                            lib.notify({
                                title = "Kamionak",
                                icon = "fa-solid fa-truck",
                                description = "Navigace nastavena",
                                type = "sucess"
                            })
                            SetNewWaypoint(Config.Depo.Paleto.coords.x, Config.Depo.Paleto.coords.y)

                            CreateThread(function ()
                                local model = "a_m_m_farmer_01"
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(500)
                                end
                                local ped = CreatePed(5, model, Config.Depo.Paleto.returnVehCoords.x,Config.Depo.Paleto.returnVehCoords.y,Config.Depo.Paleto.returnVehCoords.z,Config.Depo.Paleto.returnVehCoords.w, false, true)
                                SetEntityAsMissionEntity(ped, true, true)
                                SetBlockingOfNonTemporaryEvents(ped, true)
                                SetPedDiesWhenInjured(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, false)
                                SetPedCanRagdoll(ped, false)
                                SetEntityInvincible(ped, true)
                                table.insert(returnvehNPC_one, ped)

                                target:addLocalEntity(returnvehNPC_one, {
                                    name = "vraceni_vozidla",
                                    icon = "fa-solid fa-truck",
                                    label = "vratit vozidlo",
                                    onSelect = function ()
                                        if vehicle then
                                            if DoesEntityExist(vehicle) then
                                                DeleteEntity(vehicle)
                                            end
                                            vehicle = nil

                                            TriggerServerEvent('cb_kamiony:server:payout:paleto')
                                        end
                                    end
                                })
                            end)
                        end
                    },
                    {
                        title = "Sandy",
                        icon = "fa-solid fa-truck",
                        metadata = {
                            {label = "dostanete", value = ""..Config.Price.sandy.."$"}
                        },
                        onSelect = function ()
                            local randomTrailer = RandomTrailer(Config.TrailerSpawnCode)
                            local car = GetHashKey("hauler")
                            RequestModel(car)
                            while not HasModelLoaded(car) do 
                                Wait(500)
                            end
                            vehicle = CreateVehicle(car, Config.SpawnVehicle.x, Config.SpawnVehicle.y, Config.SpawnVehicle.z, Config.SpawnVehicle.w, true, true)
                            RequestModel(randomTrailer)
                            while not HasModelLoaded(randomTrailer) do 
                                Wait(500)
                            end
                            trailer = CreateVehicle(randomTrailer, Config.SpawnTrailer.x, Config.SpawnTrailer.y, Config.SpawnTrailer.z, Config.SpawnTrailer.w, true, true)
                            -- navigace
                            lib.notify({
                                title = "Kamionak",
                                icon = "fa-solid fa-truck",
                                description = "Navigace nastavena",
                                type = "sucess"
                            })
                            SetNewWaypoint(Config.Depo.Sandy.coords.x, Config.Depo.Sandy.coords.y)

                            CreateThread(function ()
                                local model = "a_m_m_farmer_01"
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(500)
                                end
                                local ped = CreatePed(5, model, Config.Depo.Sandy.returnVehCoords.x,Config.Depo.Sandy.returnVehCoords.y,Config.Depo.Sandy.returnVehCoords.z,Config.Depo.Sandy.returnVehCoords.w, false, true)
                                SetEntityAsMissionEntity(ped, true, true)
                                SetBlockingOfNonTemporaryEvents(ped, true)
                                SetPedDiesWhenInjured(ped, false)
                                SetPedCanRagdollFromPlayerImpact(ped, false)
                                SetPedCanRagdoll(ped, false)
                                SetEntityInvincible(ped, true)
                                table.insert(returnvehNPC_one, ped)

                                target:addLocalEntity(returnvehNPC_one, {
                                    name = "vraceni_vozidla",
                                    icon = "fa-solid fa-truck",
                                    label = "vratit vozidlo",
                                    onSelect = function ()
                                        if vehicle then
                                            if DoesEntityExist(vehicle) then
                                                DeleteEntity(vehicle)
                                            end
                                            vehicle = nil

                                            TriggerServerEvent('cb_kamiony:server:payout:sandy')
                                        end
                                    end
                                })
                            end)
                        end
                    }
                }
            })
            lib.showContext('depa')
        end
    })
end)