local atmModels = {
    `prop_atm_01`,
    `prop_atm_02`,
    `prop_atm_03`,
    `prop_fleeca_atm`
}

Citizen.CreateThread(function()
    for _, model in pairs(atmModels) do
        exports['qb-target']:AddTargetModel(model, {
            options = {
                {
                    type = "client",
                    event = "dj_atm:client:openMenu",
                    icon = "fas fa-credit-card",
                    label = "Access ATM",
                }
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent('dj_atm:client:openMenu', function()
    local menu = {
        {
            header = "ATM",
            isMenuHeader = true
        },
        {
            header = "💰 Withdraw",
            txt = "Take money from your bank",
            params = { event = "dj_atm:client:withdraw" }
        },
        {
            header = "📥 Deposit",
            txt = "Put money into your bank",
            params = { event = "dj_atm:client:deposit" }
        },
        {
            header = "📄 Check Balance",
            txt = "See how much you have",
            params = { event = "dj_atm:client:checkBalance" }
        },
        {
            header = "❌ Close",
            txt = "",
            params = { event = "" }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('dj_atm:client:withdraw', function()
    local input = exports['qb-input']:ShowInput({
        header = "Withdraw Money",
        submitText = "Withdraw",
        inputs = {
            { type = 'number', name = 'amount', text = 'Amount to Withdraw' }
        }
    })

    if input and input.amount then
        TriggerServerEvent('dj_atm:withdraw', tonumber(input.amount))
    end
end)

RegisterNetEvent('dj_atm:client:deposit', function()
    local input = exports['qb-input']:ShowInput({
        header = "Deposit Money",
        submitText = "Deposit",
        inputs = {
            { type = 'number', name = 'amount', text = 'Amount to Deposit' }
        }
    })

    if input and input.amount then
        TriggerServerEvent('dj_atm:deposit', tonumber(input.amount))
    end
end)

RegisterNetEvent('dj_atm:client:checkBalance', function()
    TriggerServerEvent('dj_atm:checkBalance')
end)
