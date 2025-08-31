function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Define efeito visual conforme forma do alvo
    local subName = getSubName(cid, target)
    local eff2

    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        eff2 = 641
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        eff2 = 979
    else
        eff2 = 48
    end

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = 0,
        cd    = 9,
        check = 0,
        eff   = eff2,
        spell = spell,
        cond  = "Stun"
    }

    -- Aplica dano em área com condição e efeito visual
    doMoveInArea2(cid, eff2, db1, ELECTRICDAMAGE, min, max, spell, ret)

    return true
end
