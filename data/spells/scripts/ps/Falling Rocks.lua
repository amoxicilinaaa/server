dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local effD = getSubName(cid, target) == "Crystal Onix" and 0 or 11
    local eff = getSubName(cid, target) == "Crystal Onix" and 176 or 44

    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    local function doFall(cid)
        for rocks = 1, 62 do
            addEvent(fall, rocks * 35, cid, master, ROCKDAMAGE, effD, eff)
        end
    end

    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, effD)
    end

    addEvent(doFall, 450, cid)
    addEvent(doDanoWithProtect, 1400, cid, ROCKDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)

    return true
end