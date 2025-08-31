dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local function getCreatureHealthSecurity(cid)
        if not isCreature(cid) then return 0 end
        return getCreatureHealth(cid) or 0
    end

    local posCid = getThingPosWithDebug(cid)
    local posTarget = getThingPosWithDebug(target)

    local lifeBefore = getCreatureHealthSecurity(target)

    -- Efeito visual do ataque
    doSendDistanceShoot(posCid, posTarget, 39)
    doAreaCombatHealth(cid, FIGHTINGDAMAGE, posTarget, 0, -min, -max, 584) -- punho azul

    local lifeAfter = getCreatureHealthSecurity(target)
    local damageDealt = lifeBefore - lifeAfter

    addEvent(doSendMagicEffect, 40, posCid, 286)

    if damageDealt >= 1 and isCreature(cid) then
        doCreatureAddHealth(cid, damageDealt)
        doSendAnimatedText(posCid, "+" .. damageDealt, 32)
    end

    return true
end