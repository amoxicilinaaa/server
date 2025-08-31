dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Projétil indo do caster ao alvo
    doSendDistanceShoot(posC, posT, 7)

    -- Dano com atraso e efeito visual
    doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 227)

    -- Projétil retornando do alvo ao caster após 250ms
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doSendDistanceShoot(posT, posC, 7)
        end
    end, 250)

    return true
end