function tvRP.varyHealth(variation)
	local ped = PlayerPedId()
	local n = math.floor(GetEntityHealth(ped)+variation)
	SetEntityHealth(ped,n)
end

--[ GETHEALTH ]--------------------------------------------------------------------------------------------------------------------------

function tvRP.getHealth()
	return GetEntityHealth(PlayerPedId())
end

--[ SETHEALTH ]--------------------------------------------------------------------------------------------------------------------------

function tvRP.setHealth(health)
	SetEntityHealth(PlayerPedId(),parseInt(health))
end

--[ SETFRIENDLYFIRE ]--------------------------------------------------------------------------------------------------------------------

function tvRP.setFriendlyFire(flag)
	NetworkSetFriendlyFireOption(flag)
	SetCanAttackFriendly(PlayerPedId(),flag,flag)
end

--[ NOCAUTEVAR ]-------------------------------------------------------------------------------------------------------------------------

local nocauteado = false
local deathtimer = 900

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDEAD
-----------------------------------------------------------------------------------------------------------------------------------------
local nocauteado = false
local timedeath = 3
Citizen.CreateThread(function()
	while true do
		local timeDistance = 400
		local ped = PlayerPedId()
		local health = GetEntityHealth(ped)
		if health <= 100 and timedeath > 0 then
			timeDistance = 0
			if not nocauteado then
				
				if IsEntityDead(ped) then
					local x,y,z = table.unpack(GetEntityCoords(ped))
					NetworkResurrectLocalPlayer(x,y,z,true,true,false)
					Citizen.Wait(1)
				end
				nocauteado = true
				SetPedMaxHealth(PlayerPedId(),400)
				SetEntityHealth(PlayerPedId(),400)
				SetEntityInvincible(ped,true)
				if IsPedInAnyVehicle(ped) then
				end
				NetworkSetVoiceActive(false)
			else
				if health < 100 then
					SetPedMaxHealth(PlayerPedId(),400)
				SetEntityHealth(PlayerPedId(),400)
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if nocauteado then
			timedeath = timedeath - 1
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		local timeDistance = 400
		if nocauteado and timedeath <= 0 then
		  	timeDistance = 0
	    	if IsControlJustPressed(0,38) then
				nocauteado = false
				SetPedMaxHealth(PlayerPedId(),400)
				SetEntityHealth(PlayerPedId(),400)
				SetEntityInvincible(PlayerPedId(),false)
				ClearPedTasks(PlayerPedId())
				SetTimeout(1000,function()
					timedeath = 3
				end)
			end
		end
		Citizen.Wait(timeDistance)
	end
end)


Citizen.CreateThread(function()
	while true do
		local timeDistance = 1
		if nocauteado then
			timeDistance = 0
			local ped = PlayerPedId()
		-- 	local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),1617.8125,-39.015701293945,169.75389099121)
		-- 	local distancia2 = GetDistanceBetweenCoords(GetEntityCoords(ped),-250.09222412109,1564.150390625,341.43487548828)
		--     if distancia < 450 then
		-- 	   SetEntityCoords(ped,1169.4693603516,-290.95324707031,69.021858215332)
		--     end
		-- 	if distancia2 < 250 then
	    --  SetEntityCoords(ped,-146.02418518066,1448.5228271484,293.68927001953)
		-- 	end
			if timedeath > 0 then
				drawTxt("AGUARDE ~g~"..timedeath.." PARA REVIVER ",4,0.5,0.93,0.50,255,255,255,255)
			elseif timedeath <= 0 then
				drawTxt("PRESSIONE ~g~E ~w~PARA REVIVER",4,0.5,0.93,0.50,255,255,255,255)
			end
			if IsPedSittingInAnyVehicle(ped) then
				local veh = GetVehiclePedIsIn(ped,false)
				TaskLeaveVehicle(ped,veh,4160)
			end

			SetPedToRagdoll(ped,1000,1000,0,0,0,0)
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,23,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,271,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,177,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,168,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,311,true)
		end
		Citizen.Wait(timeDistance)
	end
end)

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end


--[ BUTTONTIMER ]------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local idle = 1000
        local ped = PlayerPedId()
		if GetEntityHealth(ped) <= 101 and deathtimer <= 0 then
			idle = 5
            if IsControlJustPressed(0,38) then
                TriggerEvent("resetBleeding")
                TriggerEvent("resetDiagnostic")
                TriggerServerEvent("clearInventory")
                deathtimer = 900
                nocauteado = false
                ClearPedBloodDamage(ped)
                SetEntityInvincible(ped,false)
                DoScreenFadeOut(1000)
                SetEntityHealth(ped,240)
                SetPedArmour(ped,0)
                Citizen.Wait(1000)
                SetEntityCoords(PlayerPedId(),298.2,-584.48,43.27+0.0001,1,0,0,1)
                FreezeEntityPosition(ped,true)
                SetTimeout(5000,function()
                    FreezeEntityPosition(ped,false)
                    Citizen.Wait(1000)
                    DoScreenFadeIn(1000)
                end)
            end
		end
		Citizen.Wait(idle)
    end
end)

--[ HEALTHRECHARGE ]---------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetPlayerHealthRechargeMultiplier(PlayerId(),0)
	end
end)

--[ DEATHTIMER ]-------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if nocauteado and deathtimer > 0 then
			deathtimer = deathtimer - 1
		end
	end
end)

--[ DRAWTXT ]----------------------------------------------------------------------------------------------------------------------------

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

--[ ISINCOMA ]---------------------------------------------------------------------------------------------------------------------------

function tvRP.isInComa()
	return nocauteado
end

--[ NETWORKRESSURECTION ]----------------------------------------------------------------------------------------------------------------

function tvRP.killGod()
	nocauteado = false
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	NetworkResurrectLocalPlayer(x,y,z,true,true,false)
	ClearPedBloodDamage(ped)
	SetEntityInvincible(ped,false)
	SetEntityHealth(ped,110)
	ClearPedTasks(ped)
	ClearPedSecondaryTask(ped)
end

--[ NETWORKPRISON ]----------------------------------------------------------------------------------------------------------------------

function tvRP.PrisionGod()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) <= 101 then
		nocauteado = false
		ClearPedBloodDamage(ped)
		SetEntityInvincible(ped,false)
		SetEntityHealth(ped,110)
		ClearPedTasks(ped)
		ClearPedSecondaryTask(ped)
	end
end