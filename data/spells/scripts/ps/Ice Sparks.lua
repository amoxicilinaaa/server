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

        -- Fagulha de gelo (ID 93)
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 93)

        -- Aplica dano com efeito visual 388
        doDanoInTargetWithDelay(cid, target, ICEDAMAGE, min, max, 388)

        return true
    end

    -- Define quantidade de fagulhas
    local Sparks = math.random(2, 5)

    -- Reduz chance de cair 5
    if Sparks >= 5 then
        Sparks = math.random(4, 5)
    end

    -- Executa cada fagulha com delay progressivo
    for i = 1, Sparks do
        addEvent(doIce, i * 350, cid, target)
    end

    --[[ ❄️ FUTURO: Bônus contra tipo Dragon ou Flying
    if isCreature(target) and isInArray({"Dragon", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoInTargetWithDelay, Sparks * 400, cid, target, ICEDAMAGE, bonusMin, bonusMax, 388)
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
    addEvent(doCondition2, Sparks * 400 + 200, freeze)
    --]]

    --[[ 🌍 FUTURO: Variação de efeito por espécie
    local pokeName = getCreatureName(cid)
    local visual = 388
    if pokeName == "Glaceon" then
        visual = 177
    elseif pokeName == "Froslass" then
        visual = 152
    end
    addEvent(doDanoInTargetWithDelay, 350, cid, target, ICEDAMAGE, min, max, visual)
    --]]

    return true
end