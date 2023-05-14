ESX = exports.es_extended:getSharedObject()

-- 𝗞𝗥𝗦® --

RegisterServerEvent('krs_lavaggiosoldi')
	AddEventHandler('krs_lavaggiosoldi', function(import)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = xPlayer.getAccount(KRS.Item).money
	if amount >= import then
		TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'success', description = 'Your money has been washed.'})
		Wait(1200)
		xPlayer.removeAccountMoney(KRS.Item, import)
		xPlayer.addMoney(import)
	else
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'You don\'t have the black money.'})
     end
end)