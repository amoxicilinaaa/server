function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local min     = spellData.min
    local max     = spellData.max

    -- Verifica se é Mega X
    local isMegaX = isMega(cid) and getMegaID(cid) == "X"

    -- Define efeitos visuais
    local effDist = isMegaX and 57 or 3
    local effDano = isMegaX and 302 or 6

    -- Aplica dano tipo FIRE com efeitos visuais
    doMoveInAreaMulti(cid, effDist, effDano, bullet, bulletDano, FIREDAMAGE, min, max)

    return true
end