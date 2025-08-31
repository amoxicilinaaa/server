dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posT = getThingPosWithDebug(target)

    -- Efeito visual antecipado
    addEvent(function()
        if isCreature(target) then
            doSendMagicEffect(posT, 857)
        end
    end, 1)

    -- Dano com efeito visual sincronizado
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doAreaCombatHealth(cid, NORMALDAMAGE, posT, 0, -min, -max, 118)
        end
    end, 120)

    return true
end