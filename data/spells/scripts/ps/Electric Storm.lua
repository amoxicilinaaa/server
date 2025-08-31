dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local subName = getSubName(cid, target)
    local eff1 = 413
    local shoot1 = 41

    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        eff1 = 639
        shoot1 = 90
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        eff1 = 977
        shoot1 = 170
    end

    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    local function doFall(cid)
        for rocks = 1, 42 do
            addEvent(fall, rocks * 35, cid, master, ELECTRICDAMAGE, shoot1, eff1)
        end
    end

    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, shoot1)
    end

    addEvent(doFall, 450, cid)

    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        ret.eff = 641
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        ret.eff = 979
    else
        ret.eff = 48
    end

    addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ELECTRICDAMAGE, min, max, spell, ret)

    return true
end