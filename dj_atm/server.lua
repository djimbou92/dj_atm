local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('dj_atm:withdraw', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if amount and amount > 0 and Player.PlayerData.money["bank"] >= amount then
        Player.Functions.RemoveMoney("bank", amount, "atm-withdraw")
        Player.Functions.AddMoney("cash", amount, "atm-withdraw")
        TriggerClientEvent('QBCore:Notify', src, "You withdrew $"..amount, "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Invalid amount or insufficient funds", "error")
    end
end)

RegisterServerEvent('dj_atm:deposit', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if amount and amount > 0 and Player.PlayerData.money["cash"] >= amount then
        Player.Functions.RemoveMoney("cash", amount, "atm-deposit")
        Player.Functions.AddMoney("bank", amount, "atm-deposit")
        TriggerClientEvent('QBCore:Notify', src, "You deposited $"..amount, "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "Invalid amount or not enough cash", "error")
    end
end)

RegisterServerEvent('dj_atm:checkBalance', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local balance = Player.PlayerData.money["bank"]
    TriggerClientEvent('QBCore:Notify', src, "Your bank balance: $"..balance, "primary")
end)
