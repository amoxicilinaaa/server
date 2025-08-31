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
        id = 0,           -- 0 = área
        cd = 9,           -- duração da condição
        eff = 43,         -- efeito visual da condição
        check = 0,        -- controle interno
        first = true,     -- primeira aplicação
        cond = "Slow"     -- tipo de condição
    }

    -- Aplica dano tipo ICE na área db1 com efeito visual 388 e condição Slow
    doMoveInArea2(cid, 388, db1, ICEDAMAGE, min, max, spell, ret)

    --[[ ?? FUTURO: Bônus contra tipo Dragon ou Flying
    if isCreature(target) and isInArray({"Dragon", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 400, cid, 388, db1, ICEDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ ?? FUTURO: Aplicar congelamento por 3 segundos
    local freeze = {
        id = target,
        cd = 3,
        eff = 52,
        check = 0,
        spell = spell,
        cond = "Frozen",
        first = true
    }
    addEvent(doCondition2, 500, freeze)
    --]]

    --[[ ?? FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = db1
    if pokeName == "Glalie" then
        area = BigArea1
    elseif pokeName == "Froslass" then
        area = reto5
    end
    doMoveInArea2(cid, 388, area, ICEDAMAGE, min, max, spell, ret)
    --]]

    return true
end
