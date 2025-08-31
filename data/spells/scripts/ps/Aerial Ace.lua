dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    local eff = {16, 221, 223, 243}

    -- Dispara 32 efeitos visuais com intervalo de 22ms
    for rocks = 1, 32 do
        addEvent(function()
            if isCreature(cid) and isCreature(master) then
                fall(cid, master, FLYINGDAMAGE, -1, eff[math.random(1, #eff)])
            end
        end, rocks * 22)
    end

    -- Aplica dano em área após 500ms
    addEvent(function()
        if isCreature(cid) then
            doMoveInArea2(cid, 0, BigArea2, FLYINGDAMAGE, min, max, spell)
        end
    end, 500)
    return true
end