function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local area    = getThingPosWithDebug(cid)
    local dano    = {}
    local effect  = 255
    local effectTangrowth, effectTangela

    local mydir = getCreatureLookDir(cid)

    -- Define área e dano conforme direção
    if mydir == 0 then
        area.x = area.x + 1
        area.y = area.y - 1
        dano = whipn
        effect = 80
        effectTangrowth = 454
        effectTangela = 522
    elseif mydir == 1 then
        area.x = area.x + 2
        area.y = area.y + 1
        dano = whipe
        effect = 83
        effectTangrowth = 453
        effectTangela = 521
    elseif mydir == 2 then
        area.x = area.x + 1
        area.y = area.y + 2
        dano = whips
        effect = 81
        effectTangrowth = 451
        effectTangela = 519
    elseif mydir == 3 then
        area.x = area.x - 1
        area.y = area.y + 1
        dano = whipw
        effect = 82
        effectTangrowth = 452
        effectTangela = 520
    end

    -- Efeito visual adaptado por forma
    local subName = getSubName(cid, target)
    if subName == "Tangrowth" then
        doSendMagicEffect(area, effectTangrowth)
    elseif subName == "Tangela" then
        doSendMagicEffect(area, effectTangela)
    else
        doSendMagicEffect(area, effect)
    end

    -- Aplica dano em área
    doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), dano, -min, -max, 255)

    return true
end
