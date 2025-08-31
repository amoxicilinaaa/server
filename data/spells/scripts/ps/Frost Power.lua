function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local posC1 = spellData.posC1 or getThingPosWithDebug(cid)

    local dano
    local eff

    -- Define tipo de dano e efeito visual com base na spell
    if spell == "Earthshock" or spell == "Earth Power" then
        dano = GROUNDDAMAGE

        -- Crystal Onix tem efeito visual especial
        if getSubName(cid, target) == "Crystal Onix" then
            eff = 179
        else
            eff = 127
        end
    else
        -- Qualquer outra spell (ex: Frost Power, Iceshock)
        dano = ICEDAMAGE
        eff = 179
    end

    -- Aplica dano em área
    doAreaCombatHealth(cid, dano, getThingPosWithDebug(cid), splash, -min, -max, 255)

    -- Aplica efeito visual na posição secundária
    doSendMagicEffect(posC1, eff)

    --[[ ❄️ Sugestão opcional: bônus contra tipo Flying ou Dragon
    if isCreature(target) and (isPokeType(target, "Flying") or isPokeType(target, "Dragon")) then
        local bonusMin = math.floor(min * 0.2)
        local bonusMax = math.floor(max * 0.2)
        addEvent(doAreaCombatHealth, 300, cid, dano, getThingPosWithDebug(cid), splash, -bonusMin, -bonusMax, 255)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end