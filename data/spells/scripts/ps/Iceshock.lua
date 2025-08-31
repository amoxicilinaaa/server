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

    local dano, eff

    if spell == "Earthshock" or spell == "Earth Power" then
        dano = GROUNDDAMAGE

        -- Efeito visual especial se o alvo for Crystal Onix
        if getSubName(cid, target) == "Crystal Onix" then
            eff = 179
        else
            eff = 127
        end
    else
        -- Fallback para spells de gelo (pode expandir com isInArray futuramente)
        dano = ICEDAMAGE
        eff = 179
    end

    -- Aplica dano em área com efeito visual
    doAreaCombatHealth(cid, dano, getThingPosWithDebug(cid), splash, -min, -max, 255)
    doSendMagicEffect(posC1, eff)

    --[[ 🔥 FUTURO: Bônus contra tipo Fire ou Flying
    if isCreature(target) and isInArray({"Fire", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doAreaCombatHealth, 400, cid, dano, getThingPosWithDebug(cid), splash, -bonusMin, -bonusMax, 255)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌋 FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = splash
    if pokeName == "Rhyperior" then
        area = BigArea2
    elseif pokeName == "Golem" then
        area = rock3
    end
    doAreaCombatHealth(cid, dano, getThingPosWithDebug(cid), area, -min, -max, 255)
    --]]

    --[[ 🪨 FUTURO: Aplicar condição "Stun" por 2 segundos
    local ret = {
        id = target,
        cd = 2,
        eff = 147,
        check = 0,
        spell = spell,
        cond = "Stun",
        first = true
    }
    addEvent(doCondition2, 500, ret)
    --]]

    return true
end