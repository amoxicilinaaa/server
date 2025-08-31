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

    -- Define parâmetros da condição "Sleep"
    local ret = {}

    -- Se for da família Hypno ou Poli, aplica em área
    if isInArray({"Hypno", "Shiny Hypno", "Poliwag", "Poliwhirl", "Poliwrath"}, getSubName(cid, target)) then
        ret.id = 0 -- aplica em área
    else
        ret.id = target -- aplica diretamente no alvo
    end

    ret.cd = math.random(7, 8) -- duração aleatória entre 7 e 8 segundos
    ret.check = getPlayerStorageValue(target, conds["Sleep"]) -- evita reaplicação
    ret.first = true
    ret.cond = "Sleep"

    -- Comportamento especial para Hypno e Poli
    if isInArray({"Hypno", "Shiny Hypno", "Poliwag", "Poliwhirl", "Poliwrath"}, getSubName(cid, target)) then
        addEvent(doSendMagicEffect, 20, posC1, 684) -- efeito inicial
        doSendMagicEffect(posC1, 906)               -- efeito secundário (novo sprite)
        addEvent(doMoveInArea2, 20, cid, 0, bombWee1, PSYCHICDAMAGE, 0, 0, spell, ret)
    else
        -- Comportamento padrão: projétil e aplicação direta
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 24)
        addEvent(doMoveDano2, 150, cid, target, PSYCHICDAMAGE, 0, 0, ret, spell)
    end

    --[[ 🧠 FUTURO: Bônus contra tipo Fighting ou Poison
    if isCreature(target) and isInArray({"Fighting", "Poison"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveDano2, 400, cid, target, PSYCHICDAMAGE, bonusMin, bonusMax, ret, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 💤 FUTURO: Aplicar efeito visual recorrente enquanto estiver dormindo
    local function sleepLoop(target, duration)
        if isCreature(target) and duration > 0 and getPlayerStorageValue(target, conds["Sleep"]) >= 0 then
            doSendMagicEffect(getThingPosWithDebug(target), 684)
            addEvent(sleepLoop, 1000, target, duration - 1)
        end
    end
    addEvent(sleepLoop, 500, target, ret.cd)
    --]]

    --[[ 🌍 FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = bombWee1
    if pokeName == "Drowzee" then
        area = BigArea1
    elseif pokeName == "Shiny Hypno" then
        area = reto5
    end
    addEvent(doMoveInArea2, 20, cid, 0, area, PSYCHICDAMAGE, 0, 0, spell, ret)
    --]]

    return true
end