function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica múltiplos efeitos visuais e dano em área
    -- Parâmetros: cid, efeito de distância, efeito de impacto, área visual, área de dano, tipo de dano, min, max
    doMoveInAreaMulti(cid, 14, 785, bullet, bulletDano, POISONDAMAGE, min, max)

    --[[ ☠️ FUTURO: Bônus contra tipo Fairy ou Grass
    local target = spellData.target
    if isCreature(target) and isInArray({"Fairy", "Grass"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInAreaMulti, 400, cid, 14, 785, bullet, bulletDano, POISONDAMAGE, bonusMin, bonusMax)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌿 FUTURO: Aplicar condição de "Poisoned" por 6 segundos
    local ret = {
        id = cid,
        cd = 6,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Poisoned",
        first = true
    }
    doCondition2(ret)
    --]]

    return true
end