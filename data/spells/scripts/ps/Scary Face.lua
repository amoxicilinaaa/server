function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local posC1  = {x = getThingPosWithDebug(cid).x + 1, y = getThingPosWithDebug(cid).y, z = getThingPosWithDebug(cid).z}

    -- Parâmetros da condição "Stun"
    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Efeito visual adaptado por forma do alvo
    local name = getSubName(cid, target)
    if isInArray({"Shiny Gengar", "Tyranitar", "Gyarados"}, name) then
        doSendMagicEffect(posC1, 542)
    else
        doSendMagicEffect(posC1, 228)
    end

    -- Aplica dano em área com condição Stun
    doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)

    return true
end
