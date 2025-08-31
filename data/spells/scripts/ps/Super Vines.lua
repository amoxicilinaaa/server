function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Interrompe movimento e define direção
    stopNow(cid, 200)
    doCreatureSetLookDir(cid, 2)

    -- Define posição do efeito visual
    local pos = getThingPosWithDebug(cid)
    pos.x = pos.x + 1
    pos.y = pos.y + 1

    -- Escolhe efeito visual conforme forma
    local name = getSubName(cid, target)
    local effect = 213 -- padrão: Tangela
    if name == "Tangrowth" then
        effect = 504
    elseif name == "Shiny Tangrowth" then
        effect = 505
    elseif name == "Shiny Tangela" then
        effect = 229
    end

    -- Aplica efeito visual
    doSendMagicEffect(pos, effect)

    -- Aplica dano com tipo específico
    local damageType = (name == "Tangrowth") and SEED_BOMBDAMAGE or GRASSDAMAGE
    doDanoWithProtect(cid, damageType, getThingPosWithDebug(cid), splash, -min, -max, 0)

    return true
end
