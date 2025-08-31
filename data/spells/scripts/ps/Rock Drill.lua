function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local name = getSubName(cid, target)

    -- Megahorn com dano NORMAL para formas específicas
    if isInArray({"Rapidash", "Shiny Rapidash", "Seaking"}, name) and spell == "Megahorn" then
        doMoveInAreaMulti(cid, 25, 118, bullet, bulletDano, NORMALDAMAGE, min, max)

    else
        if spell == "Megahorn" then
            doMoveInAreaMulti(cid, 25, 8, bullet, bulletDano, BUGDAMAGE, min, max)

        elseif spell == "Drill Run" or spell == "Rock Drill" then
            doMoveInAreaMulti(cid, 159, 118, bullet, bulletDano, EARTHDAMAGE, min, max)
            addEvent(doMoveInAreaMulti, 25, cid, 98, 754, bullet, bulletDano, EARTHDAMAGE, 0, 0)
        end
    end

    return true
end
