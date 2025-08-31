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
        [0] = {149, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- Norte
        [1] = {150, {x = p.x + 6, y = p.y + 1, z = p.z}}, -- Leste
        [2] = {149, {x = p.x + 1, y = p.y + 6, z = p.z}}, -- Sul
        [3] = {150, {x = p.x - 1, y = p.y + 1, z = p.z}}  -- Oeste
    }

    -- Efeito inicial no caster (ID 628)
    doSendMagicEffect(posC, 628)

    -- Efeito secundário após 700ms (ID 627)
    addEvent(doSendMagicEffect, 700, posC, 627)

    -- Aplica dano tipo NORMAL na área triplo6 com delay
    addEvent(doMoveInArea2, 420, cid, 0, triplo6, NORMALDAMAGE, min, max, spell)

    -- Efeito visual adicional baseado na direção
    addEvent(doSendMagicEffect, 420, t[a][2], t[a][1])

    --[[ 🔥 FUTURO: Bônus contra tipo Ghost ou Flying
    if isCreature(target) and isInArray({"Ghost", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 800, cid, 0, triplo6, NORMALDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌍 FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = triplo6
    if pokeName == "Tauros" then
        area = BigArea1
    elseif pokeName == "Kangaskhan" then
        area = reto5
    end
    addEvent(doMoveInArea2, 420, cid, 0, area, NORMALDAMAGE, min, max, spell)
    --]]

    --[[ 🧊 FUTURO: Aplicar condição "Stun" por 2 segundos após impacto
    local ret = {
        id = target,
        cd = 2,
        eff = 147,
        check = 0,
        spell = spell,
        cond = "Stun",
        first = true
    }
    addEvent(doCondition2, 600, ret)
    --]]

    return true
end