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

    local subName = getSubName(cid, target)

    -- Aplica dano tipo FIGHTING com variação de efeito visual por espécie
    if subName == "Elite Hitmonlee" then
        doMoveInAreaMulti(cid, 42, 651, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
    elseif subName == "Shiny Hitmonlee" then
        doMoveInAreaMulti(cid, 42, 652, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
    else
        doMoveInAreaMulti(cid, 42, 113, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
    end

    return true
end