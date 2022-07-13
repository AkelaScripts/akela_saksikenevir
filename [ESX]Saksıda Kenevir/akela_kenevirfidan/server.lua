ESX = nil

--Bu script Akela tarafından kodlanmıştır. Emeğe saygı.

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('tohum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('saksi').count >= 1 then
		if xPlayer.getInventoryItem('gubre').count >= 1 then
			if xPlayer.getInventoryItem('su').count >= 1 then
				TriggerClientEvent('akela_kenevirfidan:basla', source)
			else 
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Mineralli su yetersiz!'})
			end
		else 
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Gübre yetersiz!'})
		end
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Saksıya ihtiyacın var!'})
	end
end)

RegisterNetEvent('akela_kenevirfidan:remove')
AddEventHandler('akela_kenevirfidan:remove', function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item,count)
end)

ESX.RegisterUsableItem('gubre', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('gubre').count >= Config.GubreCount then
		TriggerClientEvent('akela_kenevirfidan:gubre', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Gübre yetersiz!'})
	end	
end)

RegisterNetEvent('akela_kenevirfidan:gubrever')
AddEventHandler('akela_kenevirfidan:gubrever', function(count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('gubre', count)
end)

ESX.RegisterUsableItem('su', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('su').count >= Config.GubreCount then
		TriggerClientEvent('akela_kenevirfidan:su', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Su yetersiz!'})
	end	
end)

RegisterNetEvent('akela_kenevirfidan:suver')
AddEventHandler('akela_kenevirfidan:suver', function(count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('su', count)
end)

RegisterNetEvent('akela_kenevirfidan:give')
AddEventHandler('akela_kenevirfidan:give', function(item,count)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.canCarryItem(item, count) then
		xPlayer.addInventoryItem(item, count)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Çantanda yer yok!'})
	end
end)

RegisterNetEvent('akela_kenevirfidan:Sell')
AddEventHandler('akela_kenevirfidan:Sell', function(item,count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = item
	local count = xPlayer.getInventoryItem(item).count
	if count > 0 then 
		xPlayer.removeInventoryItem(item, count)
		local payment = Config.Prize
		payment = math.random(Config.Prize, Config.Prize2) 
		xPlayer.addInventoryItem('black_money', payment * count)
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = count.. ' Kenevir sattın ' ..payment * count.. '$ karapara kazandın!' })
	end 
end)