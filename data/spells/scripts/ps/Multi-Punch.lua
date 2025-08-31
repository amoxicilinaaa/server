function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    --[[ Suporte para variação por atributo "hands" da ball
    local hands = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "hands")
    if hands then
        local eff = 112
        if hands == 1 then eff = 356
        elseif hands == 2 then eff = 48
        elseif hands == 3 then eff = 43
        elseif hands == 4 then eff = 136 end

        doMoveInAreaMulti(cid, 98, eff, multi, multiDano, FIGHTINGDAMAGE, 0, 0)
        return true
    end
    ]]

    -- Execução padrão com efeito visual 112
    addEvent(doMoveInAreaMulti, 100, cid, 39, 112, multi, multiDano, FIGHTINGDAMAGE, min, max)

    return true
end