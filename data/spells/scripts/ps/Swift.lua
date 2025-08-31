function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Função que dispara projétil e aplica dano
    local function sendSwift(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
        doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3)
    end

    -- Executa dois disparos com delay
    addEvent(sendSwift, 100, cid, target)
    addEvent(sendSwift, 200, cid, target)

    return true
end
