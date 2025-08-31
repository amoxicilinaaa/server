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

    -- Aplica dano tipo FIGHTING em múltiplas áreas com múltiplos efeitos visuais
    -- Parâmetros: cid, efeito de distância, efeito de impacto, áreas, efeitos, tipo de dano, min, max
    doMoveInAreaMulti(cid, 39, 113, multi, multiDano, FIGHTINGDAMAGE, min, max)

    --[[ 🥊 FUTURO: Bônus contra tipo Ice, Rock ou Dark
    local target = spellData and spellData.target
    if isCreature(target) and isInArray({"Ice", "Rock", "Dark"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInAreaMulti, 400, cid, 39, 113, multi, multiDano, FIGHTINGDAMAGE, bonusMin, bonusMax)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 💪 FUTURO: Aplicar condição "Defense Down" por 5 segundos
    local ret = {
        id = target,
        cd = 5,
        eff = 0,
        check = getPlayerStorageValue(target, conds["Defense Down"]),
        spell = spell,
        cond = "Defense Down",
        first = true
    }
    addEvent(doCondition2, 500, ret)
    --]]

    --[[ 🌠 FUTURO: Variação de efeitos por espécie
    local pokeName = getCreatureName(cid)
    local impact = 113
    if pokeName == "Machamp" then
        impact = 177
    elseif pokeName == "Hitmonlee" then
        impact = 152
    end
    doMoveInAreaMulti(cid, 39, impact, multi, multiDano, FIGHTINGDAMAGE, min, max)
    --]]

    return true
end