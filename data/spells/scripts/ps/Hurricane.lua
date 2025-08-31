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

    -- Função que executa um ataque tipo FLYING em área
    local function hurricane(cid)
        if not isCreature(cid) then return true end

        -- Cancela se estiver dormindo e com storage ativo
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end

        -- Cancela se estiver com medo e storage ativo
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        -- Executa ataque em área com efeito visual 42
        doMoveInArea2(cid, 42, bombWee1, FLYINGDAMAGE, min, max, spell)
    end

    -- Muda outfit do caster por 10 segundos (lookType 1398)
    doSetCreatureOutfit(cid, {lookType = 1398}, 10000)

    -- Ativa storage para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)

    -- Desativa storage após 17 ciclos de 600ms
    addEvent(setPlayerStorageValue, 17 * 600, cid, 3644587, -1)

    -- Executa 17 ataques em sequência com delay progressivo
    for i = 1, 17 do
        addEvent(hurricane, i * 600, cid)
    end

    --[[ 💨 FUTURO: Bônus contra tipo Grass, Bug ou Fighting
    if isCreature(target) and isInArray({"Grass", "Bug", "Fighting"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 11000, cid, 42, bombWee1, FLYINGDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌪️ FUTURO: Aplicar condição "Flinch" após último impacto
    local flinch = {
        id = target,
        cd = 2,
        eff = 147,
        check = getPlayerStorageValue(target, conds["Flinch"]),
        spell = spell,
        cond = "Flinch",
        first = true
    }
    addEvent(doCondition2, 11000, flinch)
    --]]

    --[[ 🌍 FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = bombWee1
    if pokeName == "Tornadus" then
        area = BigArea1
    elseif pokeName == "Pidgeot" then
        area = reto5
    end
    addEvent(doMoveInArea2, 600, cid, 42, area, FLYINGDAMAGE, min, max, spell)
    --]]

    return true
end