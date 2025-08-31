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

    -- Função que aplica dano tipo ICE com efeito visual de fagulha
    local function doIce(cid, target)
        if not isCreature(cid) or not isCreature(target) then return false end

        -- Fagulha de gelo (ID 28)
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 28)

        -- Aplica dano tipo ICE com efeito visual padrão
        doDanoInTargetWithDelay(cid, target, ICEDAMAGE, min, max)

        -- Efeito visual extra próximo ao alvo (ID 387)
        local pos = getThingPosWithDebug(target)
        addEvent(doSendMagicEffect, 200, {x = pos.x, y = pos.y, z = pos.z}, 52)

        return true
    end

    -- Executa duas fagulhas com delay progressivo
    for i = 1, 2 do
        addEvent(doIce, i * 350, cid, target)
    end

    --[[ ❄️ FUTURO: Bônus contra tipo Dragon ou Flying
    if isCreature(target) and isInArray({"Dragon", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoInTargetWithDelay, 800, cid, target, ICEDAMAGE, bonusMin, bonusMax)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🧊 FUTURO: Aplicar condição "Frozen" por 3 segundos após último impacto
    local freeze = {
        id = target,
        cd = 3,
        eff = 52,
        check = 0,
        spell = spell,
        cond = "Frozen",
        first = true
    }
    addEvent(doCondition2, 900, freeze)
    --]]

    --[[ 🌍 FUTURO: Variação de efeito por espécie
    local pokeName = getCreatureName(cid)
    local visual = 387
    if pokeName == "Glaceon" then
        visual = 177
    elseif pokeName == "Froslass" then
        visual = 152
    end
    local pos = getThingPosWithDebug(target)
    addEvent(doSendMagicEffect, 200, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, visual)
    --]]

    return true
end