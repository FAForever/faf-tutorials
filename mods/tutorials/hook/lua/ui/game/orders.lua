local oldsao = SetAvailableOrders
function SetAvailableOrders(availableOrders, availableToggles, newSelection)
    oldsao(availableOrders, availableToggles, newSelection)
    if NoOrdersAllowed and  orderCheckboxMap then
        for _,checkbox in orderCheckboxMap do
            checkbox:Disable()
        end
    end
end
