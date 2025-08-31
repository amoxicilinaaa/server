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

    -- Condição: Paralyze por 3 segundos (sem efeito visual)
    local ret = {
        id = target,
        cd = 3,
        eff = 0,
        check = 0,
        first = true,
        cond = "Paralyze"
    }

    -- Condição: Silence por 3 segundos com efeito visual 255
    local ret2 = {
        id = target,
        cd = 3,
        check = 0,
        eff = 255,
        spell = spell,
        cond = "Silence"
    }

    -- Projétil visual (ID 95) do caster até o alvo
    doSendDistanceShoot(posC, posT, 95)

    -- Aplica dano tipo ICE com delay
    addEvent(doDanoInTargetWithDelay, 200, cid, target, ICEDAMAGE, min, max)

    -- Efeito visual especial no alvo (ID 576)
    addEvent(doSendMagicEffect, 220, posT1, 576)

    -- Aplica Paralyze e Silence sem dano nem efeito adicional
    addEvent(doMoveDano2, 195, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
    addEvent(doMoveDano2, 195, cid, target, NORMALDAMAGE, 0, 0, ret2, spell)

    --[[ ⚡ FUTURO: Bônus contra tipo Flying ou Psychic
    if isCreature(target) and isInArray({"Flying", "Psychic"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoInTargetWithDelay, 400, cid, target, ICEDAMAGE, bonusMin, bonusMax)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🧊 FUTURO: Aplicar condição "Frozen" após Silence
    local freeze = {
        id = target,
        cd = 2,
        eff = 52,
        check = getPlayerStorageValue(target, conds["Frozen"]),
        spell = spell,
        cond = "Frozen",
        first = true
    }
    addEvent(doCondition2, 600, freeze)
    --]]

    --[[ 🌍 FUTURO: Variação de efeito por espécie
    local pokeName = getCreatureName(cid)
    local visual = 576
    if pokeName == "Glaceon" then
        visual = 177
    elseif pokeName == "Froslass" then
        visual = 152
    end
    addEvent(doSendMagicEffect, 220, posT1, visual)
    --]]

    return true
end