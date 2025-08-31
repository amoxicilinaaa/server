dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posT = getThingPosWithDebug(target)
    local subname = getSubName(cid, target)
    local effect = subname == "Shiny Kingler" and 432 or 225

    doDanoWithProtect(cid, NORMALDAMAGE, posT, 0, -min, -max, effect)

    return true
end