function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max
    local pos    = getThingPosWithDebug(cid)

    -- Define efeitos visuais conforme forma do alvo
    local subName = getSubName(cid, target)
    local eff0, eff2

    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        eff0 = 640
        eff2 = 641
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        eff0 = 978
        eff2 = 979
    else
        eff0 = 409
        eff2 = 48
    end

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = 0,
        cd    = 9,
        check = 0,
        eff   = eff2,
        spell = spell,
        cond  = "Stun"
    }

    -- Efeito lateral com delay
    addEvent(doSendMagicEffect, 55, {x = pos.x + 1, y = pos.y, z = pos.z}, eff0)

    -- Dano em área com condição
    doMoveInArea2(cid, eff2, thunderr, ELECTRICDAMAGE, min, max, spell, ret)

    return true
end