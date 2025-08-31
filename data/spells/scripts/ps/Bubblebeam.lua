dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    -- Função para disparar bolhas com dano
    local function sendBubbles(cid)
        if not isCreature(cid) or not isCreature(target) then return end
        local posC = getThingPosWithDebug(cid)
        local posT = getThingPosWithDebug(target)
        doSendDistanceShoot(posC, posT, 139)
        doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 735)
    end

    -- Dispara bolhas em sequência
    sendBubbles(cid)
    addEvent(sendBubbles, 200, cid)
    addEvent(sendBubbles, 360, cid)
    addEvent(sendBubbles, 520, cid)

    return true
end