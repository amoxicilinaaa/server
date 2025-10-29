-- Do not remove the credits --
-- [ACTION] Fruit Harvesting --
-- Developed by Rigby --
-- Especially for the Xtibia.com --
 
local config = {
-- [ID_DA_ARVORE] = {FRUTA, QUANTIDADE{minimo, maximo}, ID_DA_ARVORE_SEM_FRUTO, TEMPO_PARA_ÀRVORE_FICA_COM_FRUTO}
    [8633] = {fruit = 14036, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8637] = {fruit = 14036, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8634] = {fruit = 14039, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8638] = {fruit = 14039, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8635] = {fruit = 14037, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8639] = {fruit = 14037, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8636] = {fruit = 14038, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
    [8640] = {fruit = 14038, quantity = {0,3}, treeWithoutFruit = 1336, timeToGrow = 480},
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    for i, k in pairs(config) do
        if (isInArray(i, item.itemid) == true) then
            random = math.random(k.quantity[1],k.quantity[2])
            doTransformItem(item.uid, k.treeWithoutFruit, 1)
            doPlayerAddItem(cid,k.fruit,random)
            addEvent(function()
                doTransformItem(getThingFromPos(toPosition).uid, i)
            end, k.timeToGrow * 1000)
            if random > 0 then
                doPlayerSendTextMessage(cid,27,"Você coletou "..random.." cristais.")
            else
                doPlayerSendTextMessage(cid,27,"Você teve uma má coleta, tente novamente!")
            end
        end
    end
return true
end