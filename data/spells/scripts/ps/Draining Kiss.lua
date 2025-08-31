dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local posC1 = getThingPosWithDebug(cid)
    local pid = getCreatureSummons(cid)[1] or cid -- garante que pid esteja definido

    doSendMagicEffect(posC1, 290)
    addEvent(doMoveInArea2, 210, cid, 0, heal, NORMALDAMAGE, min, max, spell)
    doSendMagicEffect(getThingPosWithDebug(pid), 855)

    return true
end