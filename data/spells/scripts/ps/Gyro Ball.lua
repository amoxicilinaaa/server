function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica dano tipo STEEL na área 'confusion' com delay
    doMoveInArea2(cid, 0, confusion, STEELDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 395, cid, 0, confusion, STEELDAMAGE, min, max, spell)

    -- Posição base do caster
    local p = getThingPosWithDebug(cid)

    -- Efeitos visuais para Pineco
    local t1 = {
        {128, {x = p.x+1, y = p.y-1, z = p.z}},
        {129, {x = p.x+2, y = p.y+1, z = p.z}},
        {131, {x = p.x+1, y = p.y+2, z = p.z}},
        {130, {x = p.x-1, y = p.y+1, z = p.z}},
    }

    -- Efeitos visuais padrão
    local t = {
        {128, {x = p.x+1, y = p.y-1, z = p.z}},
        {129, {x = p.x+2, y = p.y+1, z = p.z}},
        {131, {x = p.x+1, y = p.y+2, z = p.z}},
        {130, {x = p.x-1, y = p.y+1, z = p.z}},
    }

    -- Troca de outfit temporária dependendo do alvo
    if getSubName(cid, target) == "Forretress" then
        --[[ FUTURO: Outfit alternativo se tiver storage ativo
        if getPlayerStorageValue(cid, 925177) >= 1 then
            doSetCreatureOutfit(cid, {lookType = 1196}, 640)
        else
        --]]
            doSetCreatureOutfit(cid, {lookType = 1195}, 640)
        -- end
    elseif getSubName(cid, target) == "Pineco" then
        doSetCreatureOutfit(cid, {lookType = 1194}, 635)
    end

    -- Executa efeitos visuais em sequência
    for a = 0, 1 do
        for i = 1, 4 do
            if getSubName(cid, target) == "Pineco" then
                addEvent(doSendMagicEffect, a * 400, t1[i][2], t1[i][1])
            else
                addEvent(doSendMagicEffect, a * 400, t[i][2], t[i][1])
            end
        end
    end

    --[[ 💥 FUTURO: Bônus contra tipo Fairy ou Ice
    if isCreature(target) and isInArray({"Fairy", "Ice"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 800, cid, 0, confusion, STEELDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🛡️ FUTURO: Aplicar condição "Defense Up" no caster
    local ret = {
        id = cid,
        cd = 6,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Defense Up",
        first = true
    }
    doCondition2(ret)
    --]]

    return true
end