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

    -- Posição base do caster
    local pos = getThingPosWithDebug(cid)

    -- Função que envia uma bolha visual, respeitando estados como medo e sono
    local function doSendBubble(cid, pos)
        if not isCreature(cid) then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        -- Envia bolha visual (ID 2) com delay
        addEvent(doSendDistanceShoot, 120, getThingPosWithDebug(cid), pos, 2)
    end

    -- Gera 20 bolhas em posições aleatórias ao redor do caster
    for a = 1, 20 do
        local lugar = {
            x = pos.x + math.random(-4, 4),
            y = pos.y + math.random(-3, 3),
            z = pos.z
        }
        addEvent(doSendBubble, a * 25, cid, lugar)
    end

    -- Efeito visual no caster (ID 53)
    doSendMagicEffect(posC, 53)

    -- Aplica dano tipo WATER na área definida
    addEvent(doDanoWithProtect, 150, cid, WATERDAMAGE, pos, waterarea, -min, -max, 0)

    --[[ 🌊 FUTURO: Bônus contra tipo Fire, Rock ou Ground
    if isCreature(target) and isInArray({"Fire", "Rock", "Ground"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoWithProtect, 400, cid, WATERDAMAGE, pos, waterarea, -bonusMin, -bonusMax, 0)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 💦 FUTURO: Aplicar condição "Wet" que reduz defesa por 5 segundos
    local wet = {
        id = target,
        cd = 5,
        eff = 0,
        check = getPlayerStorageValue(target, conds["Wet"]),
        spell = spell,
        cond = "Wet",
        first = true
    }
    addEvent(doCondition2, 500, wet)
    --]]

    --[[ 🌍 FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = waterarea
    if pokeName == "Blastoise" then
        area = BigArea1
    elseif pokeName == "Kingdra" then
        area = reto5
    end
    addEvent(doDanoWithProtect, 150, cid, WATERDAMAGE, pos, area, -min, -max, 0)
    --]]

    return true
end