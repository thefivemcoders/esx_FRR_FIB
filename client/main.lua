local holdingUp = false
local store = ""
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_customrob:currentlyRobbing')
AddEventHandler('esx_customrob:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_customrob:killBlip')
AddEventHandler('esx_customrob:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_customrob:setBlip')
AddEventHandler('esx_customrob:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_customrob:tooFar')
AddEventHandler('esx_customrob:tooFar', function()
	holdingUp, store = false, ''
	exports['mythic_notify']:DoCustomHudText('inform', _U('robbery_cancelled'))
end)

RegisterNetEvent('esx_customrob:robberyComplete')
AddEventHandler('esx_customrob:robberyComplete', function(award)
	holdingUp, store = false, ''
	exports['mythic_notify']:DoHudText('success', 'Robbery complete')
end)

Citizen.CreateThread(function()
	CreateObject(-1203351544, 598.28, -3139.25, 5.07, true, true, true)
end)

RegisterNetEvent('esx_customrob:startTimer')
AddEventHandler('esx_customrob:startTimer', function()
	local fibped2 = GetHashKey('s_m_y_marine_03')
	local gun = GetHashKey('WEAPON_COMBATPDW')
	local timer = Stores[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		AddRelationshipGroup('Fib')

		RequestModel(1558115333)
		fibped1 = CreatePed(30, 1558115333, 122.4, -756.27, 45.75, 88.00, true, false)
		--CreatePed(30, fibped1, 583.54, -3117.87, 19.00, 88.00, true, false)
		SetPedArmour(fibped1, 100)
		SetPedAsEnemy(fibped1, true)
		SetPedRelationshipGroupHash(fibped1, 'Fib')
		GiveWeaponToPed(fibped1, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped1, GetPlayerPed(-1))
		SetPedAccuracy(fibped1, 100)
		SetPedDropsWeaponsWhenDead(fibped1, false)
		
		fibped2 = CreatePed(30, 1558115333, 120.43, -754.65, 45.75, 360.00, true, false)
		SetPedArmour(fibped2, 100)
		SetPedAsEnemy(fibped2, true)
		SetPedRelationshipGroupHash(fibped2, 'Fib')
		GiveWeaponToPed(fibped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped2, GetPlayerPed(-1))
		SetPedAccuracy(fibped2, 100)
		SetPedDropsWeaponsWhenDead(fibped2, false)

		fibped3 = CreatePed(30, 1558115333, 110.51, -760.47, 45.75, 350.00, true, false)
		SetPedArmour(fibped3, 100)
		SetPedAsEnemy(fibped3, true)
		SetPedRelationshipGroupHash(fibped3, 'Fib')
		GiveWeaponToPed(fibped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped3, GetPlayerPed(-1))
		SetPedAccuracy(fibped3, 100)
		SetPedDropsWeaponsWhenDead(fibped3, false)

		fibped4 = CreatePed(30, 1558115333, 117.8, -751.93, 45.75, 350.00, true, false)
		SetPedArmour(fibped4, 100)
		SetPedAsEnemy(fibped4, true)
		SetPedRelationshipGroupHash(fibped4, 'Fib')
		GiveWeaponToPed(fibped4, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped4, GetPlayerPed(-1))
		SetPedAccuracy(fibped4, 100)
		SetPedDropsWeaponsWhenDead(fibped4, false)

		fibped5 = CreatePed(30, 1558115333, 113.6, -744.84, 45.75, 300.00, true, false)
		SetPedArmour(fibped5, 100)
		SetPedAsEnemy(fibped5, true)
		SetPedRelationshipGroupHash(fibped5, 'Fib')
		GiveWeaponToPed(fibped5, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped5, GetPlayerPed(-1))
		SetPedAccuracy(fibped5, 100)
		SetPedDropsWeaponsWhenDead(fibped5, false)

		Citizen.Wait(100000)

		fibped6 = CreatePed(30, 1558115333, 112.11, -747.25, 45.75, 266.00, true, false)
		SetPedArmour(fibped6, 100)
		SetPedAsEnemy(fibped6, true)
		SetPedRelationshipGroupHash(fibped6, 'Fib')
		GiveWeaponToPed(fibped6, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped6, GetPlayerPed(-1))
		SetPedAccuracy(fibped6, 100)
		SetPedDropsWeaponsWhenDead(fibped6, false)

		fibped7 = CreatePed(30, 1558115333, 110.42, -750.83, 45.75, 298.00, true, false)
		SetPedArmour(fibped7, 0)
		SetPedAsEnemy(fibped7, true)
		SetPedRelationshipGroupHash(fibped7, 'Fib')
		GiveWeaponToPed(fibped7, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(fibped7, GetPlayerPed(-1))
		SetPedAccuracy(fibped7, 100)
		SetPedDropsWeaponsWhenDead(fibped7, false)

		fibped8 = CreatePed(30, 1558115333, 137.07, -761.1, 45.75, 266.00, true, false)
		SetPedArmour(fibped8, 100)
		SetPedAsEnemy(fibped8, true)
		SetPedRelationshipGroupHash(fibped8, 'Fib')
		GiveWeaponToPed(fibped8, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped8, GetPlayerPed(-1))
		SetPedAccuracy(fibped8, 100)
		SetPedDropsWeaponsWhenDead(fibped8, false)

		fibped9 = CreatePed(30, 1558115333, 135.26, -761.44, 45.75, 269.00, true, false)
		SetPedArmour(fibped9, 100)
		SetPedAsEnemy(fibped9, true)
		SetPedRelationshipGroupHash(fibped9, 'Fib')
		GiveWeaponToPed(fibped9, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped9, GetPlayerPed(-1))
		SetPedAccuracy(fibped9, 100)
		SetPedDropsWeaponsWhenDead(fibped9, false)

		fibped10 = CreatePed(30, 1558115333, 139.77, -762.5, 45.75, 319.00, true, false)
		SetPedArmour(fibped10, 100)
		SetPedAsEnemy(fibped10, true)
		SetPedRelationshipGroupHash(fibped10, 'Fib')
		GiveWeaponToPed(fibped10, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped10, GetPlayerPed(-1))
		SetPedAccuracy(fibped10, 100)
		SetPedDropsWeaponsWhenDead(fibped10, false)

		Citizen.Wait(250000)

		fibped11 = CreatePed(30, 1558115333, 138.16, -762.45, 45.75, 359.00, true, false)
		SetPedArmour(fibped11, 100)
		SetPedAsEnemy(fibped11, true)
		SetPedRelationshipGroupHash(fibped11, 'Fib')
		GiveWeaponToPed(fibped11, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped11, GetPlayerPed(-1))
		SetPedAccuracy(fibped11, 100)
		SetPedDropsWeaponsWhenDead(fibped11, false)

		fibped12 = CreatePed(30, 1558115333, 121.75, -755.4, 45.75, 359.00, true, false)
		SetPedArmour(fibped12, 100)
		SetPedAsEnemy(fibped12, true)
		SetPedRelationshipGroupHash(fibped12, 'Fib')
		GiveWeaponToPed(fibped12, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped12, GetPlayerPed(-1))
		SetPedAccuracy(fibped12, 100)
		SetPedDropsWeaponsWhenDead(fibped12, false)

		fibped13 = CreatePed(30, 1558115333, 106.43, -746.16, 45.75, 50.00, true, false)
		SetPedArmour(fibped13, 100)
		SetPedAsEnemy(fibped13, true)
		SetPedRelationshipGroupHash(fibped13, 'Fib')
		GiveWeaponToPed(fibped13, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped13, GetPlayerPed(-1))
		SetPedAccuracy(fibped13, 100)
		SetPedDropsWeaponsWhenDead(fibped13, false)

		fibped14 = CreatePed(30, 1558115333, 110.49, -744.69, 45.75, 268.00, true, false)
		SetPedArmour(fibped14, 100)
		SetPedAsEnemy(fibped14, true)
		SetPedRelationshipGroupHash(fibped14, 'Fib')
		GiveWeaponToPed(fibped14, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped14, GetPlayerPed(-1))
		SetPedAccuracy(fibped14, 100)
		SetPedDropsWeaponsWhenDead(fibped14, false)

		fibped15 = CreatePed(30, 1558115333, 114.74, -748.16, 45.75, 266.00, true, false)
		SetPedArmour(fibped15, 100)
		SetPedAsEnemy(fibped15, true)
		SetPedRelationshipGroupHash(fibped15, 'Fib')
		GiveWeaponToPed(fibped15, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped15, GetPlayerPed(-1))
		SetPedAccuracy(fibped15, 100)
		SetPedDropsWeaponsWhenDead(fibped15, false)

		Citizen.Wait(150000)

		fibped16 = CreatePed(30, 1558115333, 108.71, -756.79, 45.75, 266.00, true, false)
		SetPedArmour(fibped16, 200)
		SetPedAsEnemy(fibped16, true)
		SetPedRelationshipGroupHash(fibped16, 'Fib')
		GiveWeaponToPed(fibped16, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped16, GetPlayerPed(-1))
		SetPedAccuracy(fibped16, 100)
		SetPedDropsWeaponsWhenDead(fibped16, false)

		fibped17 = CreatePed(30, 1558115333, 112.69, -743.22, 45.75, 266.00, true, false)
		SetPedArmour(fibped17, 200)
		SetPedAsEnemy(fibped17, true)
		SetPedRelationshipGroupHash(fibped17, 'Fib')
		GiveWeaponToPed(fibped17, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped17, GetPlayerPed(-1))
		SetPedAccuracy(fibped17, 100)
		SetPedDropsWeaponsWhenDead(fibped17, false)

		fibped18 = CreatePed(30, 1558115333, 117.84, -751.05, 45.75, 266.00, true, false)
		SetPedArmour(fibped18, 200)
		SetPedAsEnemy(fibped18, true)
		SetPedRelationshipGroupHash(fibped18, 'Fib')
		GiveWeaponToPed(fibped18, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped18, GetPlayerPed(-1))
		SetPedAccuracy(fibped18, 100)
		SetPedDropsWeaponsWhenDead(fibped18, false)

		fibped19 = CreatePed(30, 1558115333, 103.79, -738.92, 45.76, 266.00, true, false)
		SetPedArmour(fibped19, 200)
		SetPedAsEnemy(fibped19, true)
		SetPedRelationshipGroupHash(fibped19, 'Fib')
		GiveWeaponToPed(fibped19, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped19, GetPlayerPed(-1))
		SetPedAccuracy(fibped19, 100)
		SetPedDropsWeaponsWhenDead(fibped19, false)

		fibped20 = CreatePed(30, 1558115333, 101.74, -750.16, 45.75, 182.00, true, false)
		SetPedArmour(fibped20, 200)
		SetPedAsEnemy(fibped20, true)
		SetPedRelationshipGroupHash(fibped20, 'Fib')
		GiveWeaponToPed(fibped20, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped20, GetPlayerPed(-1))
		SetPedAccuracy(fibped20, 100)
		SetPedDropsWeaponsWhenDead(fibped20, false)

		Citizen.Wait(150000)

		fibped21 = CreatePed(30, 1558115333, 107.33, -742.36, 45.75, 266.00, true, false)
		SetPedArmour(fibped21, 200)
		SetPedAsEnemy(fibped21, true)
		SetPedRelationshipGroupHash(fibped21, 'Fib')
		GiveWeaponToPed(fibped21, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(fibped21, 100)
		SetPedDropsWeaponsWhenDead(fibped21, false)

		fibped22 = CreatePed(30, 1558115333, 106.61, -747.31, 45.75, 227.00, true, false)
		SetPedArmour(fibped22, 200)
		SetPedAsEnemy(fibped22, true)
		SetPedRelationshipGroupHash(fibped22, 'Fib')
		GiveWeaponToPed(fibped22, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(fibped22, 100)
		SetPedDropsWeaponsWhenDead(fibped22, false)

		fibped23 = CreatePed(30, 1558115333, 108.82, -754.33, 45.75, 344.00, true, false)
		SetPedArmour(fibped23, 200)
		SetPedAsEnemy(fibped23, true)
		SetPedRelationshipGroupHash(fibped23, 'Fib')
		GiveWeaponToPed(fibped23, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(fibped23, 100)
		SetPedDropsWeaponsWhenDead(fibped23, false)

		Citizen.Wait(350000)

		fibped24 = CreatePed(30, 1558115333, 99.69, -737.29, 45.76, 351.00, true, false)
		SetPedArmour(fibped24, 200)
		SetPedAsEnemy(fibped24, true)
		SetPedRelationshipGroupHash(fibped24, 'Fib')
		GiveWeaponToPed(fibped24, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped24, GetPlayerPed(-1))
		SetPedAccuracy(fibped24, 100)
		SetPedDropsWeaponsWhenDead(fibped24, false)

		fibped25 = CreatePed(30, 1558115333, 99.29, -750.37, 45.75, 87.00, true, false)
		SetPedArmour(fibped25, 200)
		SetPedAsEnemy(fibped25, true)
		SetPedRelationshipGroupHash(fibped25, 'Fib')
		GiveWeaponToPed(fibped25, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped25, GetPlayerPed(-1))
		SetPedAccuracy(fibped25, 80)
		SetPedDropsWeaponsWhenDead(fibped25, false)

		fibped26 = CreatePed(30, 1558115333, 105.61, -760.35, 45.75, 182.00, true, false)
		SetPedArmour(fibped26, 200)
		SetPedAsEnemy(fibped26, true)
		SetPedRelationshipGroupHash(fibped26, 'Fib')
		GiveWeaponToPed(fibped26, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(fibped26, GetPlayerPed(-1))
		SetPedAccuracy(fibped26, 80)
		SetPedDropsWeaponsWhenDead(fibped26, false)

		fibped27 = CreatePed(30, 1558115333, 91.55, -733.45, 48.24, 179.00, true, false)
		SetPedArmour(fibped27, 200)
		SetPedAsEnemy(fibped27, true)
		SetPedRelationshipGroupHash(fibped27, 'Fib')
		GiveWeaponToPed(fibped27, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(fibped27, GetPlayerPed(-1))
		SetPedAccuracy(fibped27, 80)
		SetPedDropsWeaponsWhenDead(fibped27, false)

		fibped28 = CreatePed(30, -1285859404, 80.73, -752.12, 46.82, 6.00, true, false)
		SetPedArmour(fibped28, 200)
		SetPedAsEnemy(fibped28, true)
		SetPedRelationshipGroupHash(fibped28, 'Fib')
		GiveWeaponToPed(fibped28, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(fibped28, GetPlayerPed(-1))
		SetPedAccuracy(fibped28, 80)
		SetPedDropsWeaponsWhenDead(fibped28, false)
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		SetBlipSprite(blip, 303)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 1)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Fib Heist')
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(Stores) do
			local storePos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)

			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
					DrawMarker(Config.Marker.Type, storePos.x, storePos.y, storePos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))

						if IsControlJustReleased(0, 38) then
							TriggerServerEvent('esx_customrob:robberyStarted', k)
						end
					end
				end
			end
		end

		if holdingUp then
			local storePos = Stores[store].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Config.MaxDistance then
				TriggerServerEvent('esx_customrob:tooFar', store)
			end
		end
	end
end)
