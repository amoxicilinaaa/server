dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local master = isSummon(cid) and getCreatureMaster(cid) or cid
    local posC1 = getThingPosWithDebug(cid)

    doSendMagicEffect(posC1, 836)

    local eff = {819, 837, 507, 167, 819, 165}
    local eff2 = {167, 819, 819, 307}
    local eff3 = {307, 819, 819}

    local function doFairyWind(cid)
        for rocks = 1, 32 do
            addEvent(fall, rocks * 22, cid, master, GRASSGDAMAGE, -1, eff[math.random(1, #eff)])
            addEvent(fall, rocks * 23, cid, master, GRASSGDAMAGE, -1, eff2[math.random(1, #eff2)])
            addEvent(fall, rocks * 24, cid, master, GRASSGDAMAGE, -1, eff3[math.random(1, #eff3)])
        end
    end

    addEvent(doFairyWind, 200, cid)
    addEvent(doMoveInArea2, 490, cid, 0, BigArea1, NORMALDAMAGE, min, max, spell)

    return true
end