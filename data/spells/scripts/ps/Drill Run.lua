dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local subName = getSubName(cid, target)

    if spell == "Megahorn" then
        if isInArray({"Rapidash", "Shiny Rapidash", "Seaking"}, subName) then
            -- Megahorn com dano NORMAL para essas criaturas
            doMoveInAreaMulti(cid, 25, 118, bullet, bulletDano, NORMALDAMAGE, min, max)
        else
            -- Megahorn com dano BUG para os demais
            doMoveInAreaMulti(cid, 25, 8, bullet, bulletDano, BUGDAMAGE, min, max)
        end
    elseif spell == "Drill Run" or spell == "Rock Drill" then
        -- Drill Run ou Rock Drill com dano EARTH em dois estágios
        doMoveInAreaMulti(cid, 159, 118, bullet, bulletDano, EARTHDAMAGE, min, max)
        addEvent(doMoveInAreaMulti, 25, cid, 98, 754, bullet, bulletDano, EARTHDAMAGE, 0, 0)
    end

    return true
end