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

    -- Tabela de efeitos visuais para cada etapa
    local eff = {155, 154, 53, 155, 53}

    -- Tabela de áreas de dano
    local area = {psy1, psy2, psy3, psy4, psy5}

    -- Ativa storage para controle de estado (ex: impedir interrupções)
    setPlayerStorageValue(cid, 3644587, 1)

    -- Desativa storage após 1600ms (4 * 400)
    addEvent(setPlayerStorageValue, 4 * 400, cid, 3644587, -1)

    -- Executa 5 ataques em sequência com delay progressivo
    for i = 0, 4 do
        addEvent(doMoveInArea2, i * 400, cid, eff[i + 1], area[i + 1], WATERDAMAGE, min, max, spell)
    end

    --[[ 🌊 FUTURO: Bônus contra tipo Fire, Rock ou Ground
    if isCreature(target) and isInArray({"Fire", "Rock", "Ground"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 2000, cid, 53, psy5, WATERDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 💧 FUTURO: Aplicar condição "Wet" que reduz defesa por 5 segundos
    local wet = {
        id = target,
        cd = 5,
        eff = 0,
        check = getPlayerStorageValue(target, conds["Wet"]),
        spell = spell,
        cond = "Wet",
        first = true
    }
    addEvent(doCondition2, 1800, wet)
    --]]

    --[[ 🌍 FUTURO: Variação de efeitos por espécie
    local pokeName = getCreatureName(cid)
    if pokeName == "Blastoise" then
        eff = {177, 177, 177, 177, 177}
    elseif pokeName == "Kingdra" then
        eff = {152, 152, 152, 152, 152}
    end
    --]]

    return true
end