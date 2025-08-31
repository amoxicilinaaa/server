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

    -- Troca de outfit temporária para Golem e Shiny Golem
    if getSubName(cid, target) == "Golem" then
        addEvent(doSetCreatureOutfit, 40, cid, {lookType = 2328}, 850)
    elseif getSubName(cid, target) == "Shiny Golem" then
        addEvent(doSetCreatureOutfit, 40, cid, {lookType = 2337}, 850)
    end

    -- Interrompe ações do Pokémon por 400ms
    stopNow(cid, 400)

    -- Efeito visual no caster (ID 825)
    addEvent(doSendMagicEffect, 380, posC1, 825)

    -- Aplica dano tipo NORMAL na área "confusion" com efeito visual 3
    addEvent(doMoveInArea2, 750, cid, 3, confusion, NORMALDAMAGE, min, max, spell)

    return true
end