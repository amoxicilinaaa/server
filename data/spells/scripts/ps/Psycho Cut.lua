function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Parâmetros da condição
    local ret = {
        id = 0,
        cd = 1,
        eff = 429,
        check = 0,
        spell = spell,
        cond = 0
    }

    local name = getSubName(cid, target)

    if name == "Absol" then
        -- Outfit especial para Absol
        doSetCreatureOutfit(cid, {lookType = 2159}, 4000)

        -- Impacto principal e secundário com delay
        addEvent(doMoveInAreaMulti, 30, cid, 60, 0, bullet, bulletDano, PSYCHICDAMAGE, min, max)
        addEvent(doMoveInAreaMulti, 50, cid, 98, 585, bullet, bulletDano, PSYCHICDAMAGE, 0, 0, ret)

    elseif name == "Gallade" then
        -- Impacto com efeito de corte (pode ser expandido com storage da Swords Dance)
        doMoveInAreaMulti(cid, 62, 0, bullet, bulletDano, PSYCHICDAMAGE, min, max)
        addEvent(doMoveInAreaMulti, 22, cid, 98, 532, bullet, bulletDano, PSYCHICDAMAGE, 0, 0, ret)

    else
        -- Execução padrão para outras formas
        doMoveInAreaMulti(cid, 60, 0, bullet, bulletDano, PSYCHICDAMAGE, min, max, ret)
        addEvent(doMoveInAreaMulti, 22, cid, 98, 429, bullet, bulletDano, PSYCHICDAMAGE, 0, 0, ret)
    end

    return true
end