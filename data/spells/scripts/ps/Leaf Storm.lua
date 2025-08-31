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

    -- Efeitos visuais variados
    local eff = {245, 497, 507, 245, 496, 165}       -- folhas, raízes, aura verde
    local eff2 = {167, 245, 168, 245}                -- aura furacão, aura folha
    local eff3 = {307, 245, 496}                     -- fumaça, aura cinza

    -- Sequência de quedas com efeitos variados
    for rocks = 1, 32 do
        addEvent(fall, rocks * 22, cid, master, GRASSDAMAGE, -1, eff[math.random(1, #eff)])
        addEvent(fall, rocks * 23, cid, master, GRASSDAMAGE, -1, eff2[math.random(1, #eff2)])
        addEvent(fall, rocks * 24, cid, master, GRASSDAMAGE, -1, eff3[math.random(1, #eff3)])
        -- addEvent(fall, rocks * 25, cid, master, GRASSDAMAGE, -1, eff4[math.random(1, 3)]) -- reservado para expansão
    end

    -- Dano em área após a sequência de quedas
    addEvent(doMoveInArea2, 490, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell)

    return true
end