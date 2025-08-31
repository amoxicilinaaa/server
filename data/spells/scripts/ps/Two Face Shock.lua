function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Tabela de ataques: [efeito visual, tipo de dano]
    local atk = {
        [1] = {179, ICEDAMAGE},     -- Ice Burst
        [2] = {127, GROUNDDAMAGE}   -- Ground Shock
    }

    -- Escolhe aleatoriamente entre os dois tipos
    local rand = math.random(1, 2)

    -- Aplica dano em área
    doAreaCombatHealth(cid, atk[rand][2], getThingPosWithDebug(cid), splash, -min, -max, 255)

    -- Efeito visual deslocado
    local sps = getThingPosWithDebug(cid)
    sps.x = sps.x + 1
    sps.y = sps.y + 1
    doSendMagicEffect(sps, atk[rand][1])

    return true
end
