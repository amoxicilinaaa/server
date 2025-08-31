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

    -- Projétil visual do caster até o alvo (ID 15)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)

    -- Aplica dano tipo NORMAL com efeito visual 3
    doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3)

    --[[ 🔥 FUTURO: Bônus contra tipo Ghost ou Flying
    if isCreature(target) and isInArray({"Ghost", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoInTargetWithDelay, 400, cid, target, NORMALDAMAGE, bonusMin, bonusMax, 3)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌠 FUTURO: Variação de efeito por espécie
    local pokeName = getCreatureName(cid)
    local visual = 3
    if pokeName == "Tauros" then
        visual = 177
    elseif pokeName == "Kangaskhan" then
        visual = 152
    end
    doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, visual)
    --]]

    --[[ 🧊 FUTURO: Aplicar condição "Stun" por 2 segundos após impacto
    local ret = {
        id = target,
        cd = 2,
        eff = 147,
        check = getPlayerStorageValue(target, conds["Stun"]),
        spell = spell,
        cond = "Stun",
        first = true
    }
    addEvent(doCondition2, 500, ret)
    --]]

    return true
end