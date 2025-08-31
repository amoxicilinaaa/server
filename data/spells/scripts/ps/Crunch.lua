dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posT1 = getThingPosWithDebug(target)

    -- Dano principal com efeito visual
    doDanoInTargetWithDelay(cid, target, DARKDAMAGE, 0, -min, -max, 535)

    -- Efeitos visuais adicionais em área
    addEvent(doDanoWithProtect, 10, cid, DARKDAMAGE, posT1, 0, 0, 0, 536)
    addEvent(doDanoWithProtect, 10, cid, DARKDAMAGE, posT1, 0, 0, 0, 535)
    addEvent(doDanoWithProtect, 10, cid, DARKDAMAGE, posT1, 0, 0, 0, 536)

    return true
end