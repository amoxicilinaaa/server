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

    -- Parâmetros da condição "Slow"
    local ret = {
        id = target,
        cd = 9,
        eff = 43,
        check = getPlayerStorageValue(target, conds["Slow"]),
        first = true,
        cond = "Slow"
    }

    -- Projétil visual de gelo (ID 28)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 28)

    -- Efeito visual especial no alvo (ID 625)
    doSendMagicEffect(posT1, 625)

    -- Aplica dano com proteção e efeito visual (ID 43)
    doDanoWithProtectWithDelay(cid, target, ICEDAMAGE, min, max, 43)

    -- Aplica condição "Slow" com delay
    addEvent(doMoveDano2, 50, cid, target, ICEDAMAGE, 0, 0, ret, spell)

    --[[ ❄️ FUTURO: Bônus contra tipo Dragon ou Flying
    if isCreature(target) and isInArray({"Dragon", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoWithProtectWithDelay, 400, cid, target, ICEDAMAGE, bonusMin, bonusMax, 43)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🧊 FUTURO: Aplicar condição "Frozen" por 3 segundos
    local freeze = {
        id = target,
        cd = 3,
        eff = 52,
        check = getPlayerStorageValue(target, conds["Frozen"]),
        spell = spell,
        cond = "Frozen",
        first = true
    }
    addEvent(doCondition2, 500, freeze)
    --]]

    --[[ 🌍 FUTURO: Variação de efeito por espécie
    local pokeName = getCreatureName(cid)
    local visual = 625
    if pokeName == "Glaceon" then
        visual = 177
    elseif pokeName == "Froslass" then
        visual = 152
    end
    doSendMagicEffect(posT1, visual)
    --]]

    return true
end
