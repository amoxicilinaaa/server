dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    if getCreatureOutfit(cid).lookType == 1301 then
        print("Error aconteceu com o move 'Elemental Hands', a outfit do hitmonchan está incorreta, reporte isso para a equipe um Administrador do Pokemon HP")
        doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "Aconteceu um erro... Uma mensagem foi enviada para os Administradores do Pokemon HP")
        return true
    end

    local e = getCreatureMaster(cid)
    local ball = getPlayerSlotItem(e, 8).uid
    local name = getItemAttribute(ball, "poke")
    local hands = getItemAttribute(ball, "hands")

    local posGhost = getThingPosWithDebug(cid)
    posGhost.x = posGhost.x + 1

    if hands == 4 then
        doItemSetAttribute(ball, "hands", 0)
        doSendMagicEffect(getThingPosWithDebug(cid), hitmonchans[name][0].eff)
        doSetCreatureOutfit(cid, {lookType = hitmonchans[name][0].out}, -1)
    else
        doItemSetAttribute(ball, "hands", hands + 1)
        local eff = hitmonchans[name][hands + 1].eff
        if eff == 140 then
            doSendMagicEffect(posGhost, eff)
        else
            doSendMagicEffect(getThingPosWithDebug(cid), eff)
        end
        doSetCreatureOutfit(cid, {lookType = hitmonchans[name][hands + 1].out}, -1)
    end

    return true
end