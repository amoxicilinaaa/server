function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    local master = getCreatureMaster(cid) or 0
    local eff = {240, 240, 240, 240}

    -- Efeitos de queda sequencial com dano tipo GRASS
    for rocks = 1, 32 do
        addEvent(fall, rocks * 22, cid, master, GRASSDAMAGE, -1, eff[math.random(1, 4)])
    end

    -- Dano em área após a sequência de impactos
    addEvent(doMoveInArea2, 500, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell)

    return true
end