--Bu script Akela tarafından kodlanmıştır. Emeğe saygı.

local Keys = {
 ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
 ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
 ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
 ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
 ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
 ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
 ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
 ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
 ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
   
ESX = nil
local PlayerData              = {}

local sleep = 1000
local text = false

local author = 'Akela'

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

    ESX.PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local potc = {}
local player = GetPlayerPed(-1)
local pc = {}
local modelHash3 = 'prop_weed_01'
local ekim = false
local gubreC = Config.GubreCount
local suC = Config.SuCount
local exp = 0
local gubre = 0
local su = 0
local gubreveriliyo = false 
local obj2 = {}
local obj = {}
local obj5 = {}
local pos = {}

Citizen.CreateThread(function()
	while true do 
		Wait(0)
		pos = GetEntityCoords(GetPlayerPed(-1))
	end
end)


RegisterNetEvent('akela_kenevirfidan:basla')
AddEventHandler('akela_kenevirfidan:basla', function()
	local modelHash = 'prop_weed_02'
	local modelHash2 = 'prop_peyote_highland_02'
	if not HasModelLoaded(modelHash2) then
		-- If the model isnt loaded we request the loading of the model and wait that the model is loaded
		RequestModel(modelHash2)

		while not HasModelLoaded(modelHash2) do
			Citizen.Wait(1)
		end
	end
	if not HasModelLoaded(modelHash) then
		-- If the model isnt loaded we request the loading of the model and wait that the model is loaded
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end
	if not HasModelLoaded(modelHash3) then
		-- If the model isnt loaded we request the loading of the model and wait that the model is loaded
		RequestModel(modelHash3)

		while not HasModelLoaded(modelHash3) do
			Citizen.Wait(1)
		end
	end
	if pos.y <= 3400 then
		exports['mythic_notify']:SendAlert('error', 'Şehire çok yakınsın biraz uzaklaşman lazım!')
	else 
		if ekim == false then
			TriggerServerEvent('akela_kenevirfidan:remove', 'tohum', 1)
			TriggerServerEvent('akela_kenevirfidan:remove', 'saksi', 1)
			TriggerServerEvent('akela_kenevirfidan:remove', 'gubre', 1)
			TriggerServerEvent('akela_kenevirfidan:remove', 'su', 1)
			local player = GetPlayerPed(-1)
			local pc = GetEntityCoords(player)
			obj2 = CreateObject(modelHash2, vector3(pc.x, pc.y, pc.z-1), true)
			obj = CreateObject(modelHash, vector3(pc.x, pc.y, pc.z-0.8), true)
			potc = GetEntityCoords(obj2)
			
			SetEntityCollision(obj, false, false)
			SetEntityCollision(obj2, false, false)
			
			ekim = true
			timer()
			stats()
		end
	end	
end)

local color1 = '~r~'
local color2 = '~r~'
local big = false

RegisterNetEvent('akela_kenevirfidan:particle')
AddEventHandler('akela_kenevirfidan:particle', function(posx, posy, posz, bool)

	if bool == 'a' then

		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("bul_wood_splinter", posx, posy, posz+0.2, 0.0, 0.0, 0.0, 0.8, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 135.0, 255.0, 0.0, 150)
		Citizen.Wait(22000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end

end)


RegisterNetEvent('akela_kenevirfidan:particle2')
AddEventHandler('akela_kenevirfidan:particle2', function(posx, posy, posz, bool)

	if bool == 'a' then

		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("bul_water", posx, posy, posz+0.5, 0.0, 0.0, 0.0, 0.5, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 135.0, 255.0, 0.0, 150)
		Citizen.Wait(22000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end

end)

RegisterNetEvent('akela_kenevirfidan:particle3')
AddEventHandler('akela_kenevirfidan:particle3', function(posx, posy, posz, bool)

	if bool == 'a' then

		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("bul_leaves", posx, posy, posz+0.5, 0.0, 0.0, 0.0, 1.5, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 135.0, 255.0, 0.0, 150)
		Citizen.Wait(22000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end

end)

RegisterNetEvent('akela_kenevirfidan:gubre')
AddEventHandler('akela_kenevirfidan:gubre', function()
	pc = GetEntityCoords(GetPlayerPed(-1))
	local distance = Vdist2(pc.x,pc.y,pc.z,potc.x,potc.y,potc.z)
	if distance < 4 then
		if gubreveriliyo == false then 
			if gubre < 100 then 
				TriggerServerEvent('akela_kenevirfidan:gubrever', gubreC)
				gubreveriliyo = true
				gubre = gubre + gubreC
				if gubre > 100 then gubre = 100 end
				Wait(100)
				gubreveriliyo = false
				TriggerEvent('akela_kenevirfidan:particle', potc.x, potc.y, potc.z, 'a')
			end
		end
	end
end)
RegisterNetEvent('akela_kenevirfidan:su')
AddEventHandler('akela_kenevirfidan:su', function()
	pc = GetEntityCoords(GetPlayerPed(-1))
	local distance = Vdist2(pc.x,pc.y,pc.z,potc.x,potc.y,potc.z)
	if distance < 4 then
		if gubreveriliyo == false then 
			if su < 100 then 
				TriggerServerEvent('akela_kenevirfidan:suver', gubreC)
				gubreveriliyo = true
				su = su + suC
				if su > 100 then su = 100 end
				Wait(100)
				gubreveriliyo = false
				TriggerEvent('akela_kenevirfidan:particle2', potc.x, potc.y, potc.z, 'a')
			end	
		end
	end
end)


function Draw3DText(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = 0.9
   
    if onScreen then
       -- SetTextScale(0.0*scale, 0.25*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.30)
        SetTextColour(255, 255, 255, 255)
       -- SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        --SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.030+ factor, 0.03, 0, 0, 0, 100)
    end
end
local denklem = 0 
local denklem2 = 0
local speed = 999999999999
function timer()
	if ekim == true then
		while true do 
			Citizen.Wait(0)
			if exp < 100 then 
				if gubre > 0 and su > 0 then
					Citizen.Wait(20000)
					if gubre > 0 then 
						gubre = gubre -1
					end 
					if su > 0 then
						su = su -1
					end
				end
			end
		end 
	end
end 

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)
		if ekim == true then 
			if gubre > 0 and su > 0 then
				Citizen.Wait(speed)
				if gubre > 0 and su > 0 then 
					if exp < 100 then 
						exp = exp + 1
					end	
				end
			end
		end	
	end	
end)
local toplaniyor = false
local kentopla = false 
Citizen.CreateThread(function()
	while true do 
	Citizen.Wait(0)
		if ekim == true then 
			local player = GetPlayerPed(-1)
			local pc = GetEntityCoords(player)
			local distance = Vdist2(pc.x,pc.y,pc.z,potc.x,potc.y,potc.z)
			if distance <= 6 then 
				Draw3DText(potc.x, potc.y, potc.z+0.5, 'Gübre: '..color1..gubre..'% ~w~| Su: '..color2..su..'% ~w~| Büyüme: ~g~'..exp..'%')
			end
			if gubre >= 20 then 
				color1 = '~y~'
			end 
			if gubre >= 50 then 
				color1 = '~w~'
			end 
			if gubre >= 65 then 
				color1 = '~g~'
			end 
			if gubre >= 80 then 
				color1 = '~b~'
			end 
			if su >= 20 then 
				color2 = '~y~'
			end 
			if su >= 50 then 
				color2 = '~w~'
			end 
			if su >= 65 then 
				color2 = '~g~'
			end 
			if su >= 80 then 
				color2 = '~b~'
			end 
			
			if exp >= 100 then 
				if distance <= 6 then
				if kentopla == false then 
					hintToDisplay('Kenevir toplamak için ~INPUT_CONTEXT~ bas')
					
						if IsControlJustPressed(0, Keys['E']) then
							topla()
						end	
					end
				end 
			end 
			if exp >= 50 then 
				if big == false then 
					obj5 = CreateObject(modelHash3, vector3(potc.x, potc.y, potc.z), true)
					TriggerEvent('akela_kenevirfidan:particle3', potc.x, potc.y, potc.z, 'a')
					big = true
				end 
			end 
			denklem = su + gubre
			denklem2 = denklem * 100
			speed = 30000 - denklem2 
		end	
	end 
end)

function topla()
	kentopla = true
	local miktar = Config.Miktar
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	exports['mythic_progbar']:Progress({
        name = "kenevir",
        duration = 15000,
        label = 'Kenevir toplanıyor...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(cancelled)
        if not cancelled then
			gubre = 0
			su = 0
			exp = 0
			denklem = 0
			denklem2 = 0
			speed = 9999999999
			color1 = '~r~'
			color2 = '~r~'
			big = false
			DeleteObject(obj)
			DeleteObject(obj2)
			DeleteObject(obj5)
			obj = {} 
			obj2 = {}
			obj5 = {}
			potc = {}
			pc = {}
			TriggerServerEvent('akela_kenevirfidan:give','esrar_paketlenmis',miktar)
			TriggerServerEvent('akela_kenevirfidan:give','saksi',1)
			Wait(2000)
			ekim = false
			kentopla = false
        end
    end)
end

local poop
local uretim = true
local area = Config.Area
Citizen.CreateThread(function()
	while true do 
		Wait(0)
		if uretim == true then 
			local pos = GetEntityCoords(GetPlayerPed(-1))
			local modelHash3 = 'prop_big_shit_02'
			for k, v in pairs(area) do
				local dist = GetDistanceBetweenCoords(286.76, 4329.9, 47.51, pos.x, pos.y, pos.z, true)
				local say = math.random(1,10)
				local ax = area[say].x
				local ay = area[say].y
				local az = area[say].z
				if dist <= 100 then 
					if uretim == true then
						poop = CreateObject(modelHash3, vector3(ax, ay, az), false)
						PlaceObjectOnGroundProperly(poop)
						PlaceObjectOnGroundProperly_2(poop)
						SetEntityHasGravity(poop, true)
						local blip = AddBlipForEntity(poop)
						SetBlipAsShortRange(blip, true)
						SetBlipDisplay(blip, 4)
						BeginTextCommandSetBlipName('STRING')
						AddTextComponentSubstringPlayerName('Gübre')
						EndTextCommandSetBlipName(blip)
						SetBlipScale(blip, 0.4)
						SetBlipShrink(blip, true)
						uretim = false
					end
				end
			end		
		end	
	end 
end)

 local BlipCarRoom = AddBlipForCoord(286.76, 4329.9, 47.51)
    SetBlipSprite(BlipCarRoom, 253)
    SetBlipColour(BlipCarRoom, 21)
    SetBlipScale(BlipCarRoom, 0.6)
    SetBlipAsShortRange(BlipCarRoom, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Gübre Toplama')
    EndTextCommandSetBlipName(BlipCarRoom)

Citizen.CreateThread(function()
	while true do 
		Wait(1)
		if uretim == false then 
			local poopc = GetEntityCoords(poop)
			local pos = GetEntityCoords(GetPlayerPed(-1))
			if poopc ~= nil then 
				local mesafe = GetDistanceBetweenCoords(poopc.x, poopc.y, poopc.z, pos.x, pos.y, pos.z, true)
				if mesafe < 1.3 then
				if toplaniyor == false then 
						hintToDisplay('Gübre toplamak için ~INPUT_CONTEXT~ bas')
					
						if IsControlJustPressed(0, Keys['E']) then
							gtopla()
							toplaniyor = true
						end		
					end
				end
				DrawMarker(1, Config.SellPoint.x, Config.SellPoint.y, Config.SellPoint.z , 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 0, 70, 250, 30, false, true, 2, false, false, false, false)	
			end 
		end	
	end 
end)

Citizen.CreateThread(function() 
	while true do 
		Wait(1)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.Job then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.SellPoint.x, Config.SellPoint.y, Config.SellPoint.z, true) <= 2 then
				sellKenevir()
				Citizen.Wait(2000)
			end	
		end
	end
end)
Citizen.CreateThread(function() 
	while true do 
		Wait(1)
		if ESX.PlayerData.job ~= nil and Config.Job == 'any' then
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Config.SellPoint.x, Config.SellPoint.y, Config.SellPoint.z, true) <= 2 then
				sellKenevir()
				Citizen.Wait(2000)
			end	
		end
	end
end)

function gtopla()
	local miktar = Config.Miktar
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
	exports['mythic_progbar']:Progress({
        name = "gubre",
        duration = 15000,
        label = 'Gübre toplanıyor...',
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(cancelled)
        if not cancelled then
			DeleteObject(poop)
			local luck2 = math.random(0,5)
			local luck = {}
			local verilen = 'gubre'
			if luck2 == 0 then 
				exports['mythic_notify']:SendAlert('error', 'Burada gübrelik tezek yokmuş!')
			else 
				luck = luck2
			end 
			TriggerServerEvent('akela_kenevirfidan:give',verilen,luck)
			Wait(2000)
			uretim = true
			toplaniyor = false
        end
    end)
end

function sellKenevir(amount)
	local item = 'esrar_paketlenmis'
	TriggerServerEvent('akela_kenevirfidan:Sell', item, amount)
end 
