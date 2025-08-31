function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Efeitos ascendentes antes da queda
    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, 18)
    end

    -- Função que executa a queda de energia fantasma
    local function doFall(cid)
        if not isCreature(cid) then return end
        for rocks = 1, 42 do
            addEvent(fall, rocks * 35, cid, master, ghostDmg, 18, 411)
        end
    end

    -- Executa queda e dano em área com delay
    addEvent(doFall, 450, cid)
    addEvent(doMoveInArea2, 1400, cid, 2, BigArea2, ghostDmg, min, max, spell)

    return true
end
