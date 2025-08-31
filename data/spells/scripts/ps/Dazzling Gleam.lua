dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Primeiro disparo visual
    doSendDistanceShoot(posC, posT, 16)

    -- Segundo disparo visual com delay
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doSendDistanceShoot(posC, posT, 16)
        end
    end, 80)

    -- Dano com efeito visual sincronizado
    doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, -min, -max, 242)

    return true
end