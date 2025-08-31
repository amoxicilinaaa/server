dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local area = {gale1, gale2, gale3, gale4, gale3, gale2, gale1}

    -- Executa dano em ondas com delay crescente
    for i = 0, 6 do
        addEvent(function()
            if isCreature(cid) then
                doMoveInArea2(cid, 227, area[i + 1], ROCKDAMAGE, min, max, spell)
            end
        end, i * 400)
    end

    return true
end