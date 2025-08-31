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

    -- Disparo visual
    doSendDistanceShoot(posC, posT, 39)

    -- Efeito de impacto
    doSendMagicEffect(posT, 112)

    -- Dano com efeito visual
    doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 118)

    return true
end