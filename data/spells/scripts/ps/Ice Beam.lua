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

    -- Determina a direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Posição base do caster
    local p = getThingPosWithDebug(cid)

    -- Tabela de efeitos visuais por direção
    local t = {
        [0] = {97, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- Norte
        [1] = {96, {x = p.x + 6, y = p.y + 1, z = p.z}}, -- Leste
        [2] = {97, {x = p.x + 1, y = p.y + 6, z = p.z}}, -- Sul
        [3] = {96, {x = p.x - 1, y = p.y + 1, z = p.z}}  -- Oeste
    }

    -- Parâmetros da condição "Slow"
    local ret = {
        id = 0,
        cd = 9,
        eff = 43,
        check = 0,
        first = true,
        cond = "Slow"
    }

    -- Aplica dano tipo ICE na área triplo6 com condição Slow
    doMoveInArea2(cid, 0, triplo6, ICEDAMAGE, min, max, spell, ret)

    -- Efeito visual baseado na direção
    doSendMagicEffect(t[a][2], t[a][1])

    --[[ ?? FUTURO: Bônus contra tipo Dragon ou Flying
    if isCreature(target) and isInArray({"Dragon", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 400, cid, 0, triplo6, ICEDAMAGE, bonusMin, bonusMax, spell, ret)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ ?? FUTURO: Aplicar condição "Frozen" por 3 segundos
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

    --[[ ?? FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = triplo6
    if pokeName == "Glaceon" then
        area = BigArea1
    elseif pokeName == "Froslass" then
        area = reto5
    end
    doMoveInArea2(cid, 0, area, ICEDAMAGE, min, max, spell, ret)
    --]]

    return true
end