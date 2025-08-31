dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(target) then return false end

    -- Função segura para obter vida
    local function getCreatureHealthSecurity(cid)
        return isCreature(cid) and getCreatureHealth(cid) or 0
    end

    local lifeBefore = getCreatureHealthSecurity(target)

    -- Aplica o dano
    doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 14)

    local lifeAfter = getCreatureHealthSecurity(target)
    local drained = lifeBefore - lifeAfter

    -- Efeito visual no caster
    doSendMagicEffect(getThingPosWithDebug(cid), 14)

    -- Recupera vida se houve dano
    if drained >= 1 and isCreature(cid) then
        doCreatureAddHealth(cid, drained)
        doSendAnimatedText(getThingPosWithDebug(cid), "+" .. drained, 32)
    end
    return true
end