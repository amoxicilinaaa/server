function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target

    local posC    = getThingPosWithDebug(cid)
    local posT    = getThingPosWithDebug(target)
    local Shoot   = 38 -- padrão vermelho (gancho)

    -- Ajusta efeito visual conforme forma do alvo
    if spell == "Vine Hook" then
        local subName = getSubName(cid, target)
        if subName == "Tangrowth" then
            Shoot = 38 -- missiles (padrão mesmo)
        elseif subName == "Tangela" then
            Shoot = 38 -- padrão
        else
            Shoot = 38 -- verde (comentário indicativo)
        end
    end

    -- Disparo visual do gancho
    sendDistanceShootWithProtect(cid, posC, posT, Shoot)

    -- Teleporta o alvo para perto do caster
    addEvent(doTeleportThing, 200, target, getClosestFreeTile(cid, posC), true)

    -- Disparo visual de retorno do gancho
    addEvent(sendDistanceShootWithProtect, 200, cid, posT, posC, Shoot)

    return true
end
