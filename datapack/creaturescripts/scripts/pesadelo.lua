local tpId = 1387
local tps = {
        ["Darkrai"] = {pos = {x = 898, y = 2377, z = 8}, toPos = {x = 898, y = 2372, z = 8}, time = 60},
}
 
function removeTp(tp)
        local t = getTileItemById(tp.pos, tpId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(tp.pos, CONST_ME_POFF)
        end
end
 
function onDeath(cid)
        local tp = tps[getCreatureName(cid)]
        if tp then
                doCreateTeleport(tpId, tp.toPos, tp.pos)
                doCreatureSay(cid, "O Darkrai verdadeiro foi derrotado, o teleport irá sumir em 1 minuto!", TALKTYPE_ORANGE_1)
                addEvent(removeTp, tp.time*1000, tp)
        end
        return TRUE
end