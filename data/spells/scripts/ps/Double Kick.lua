dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local posTarget = getThingPosWithDebug(target)

    -- Aplica o dano com efeito visual 148
    doAreaCombatHealth(cid, FIGHTINGDAMAGE, posTarget, 0, -min, -max, 148)

    -- Efeitos adicionais em sequência
    addEvent(doSendMagicEffect, 3, posTarget, 857)
    addEvent(doSendMagicEffect, 5, posTarget, 857)

    return true
end