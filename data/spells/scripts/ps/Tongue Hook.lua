function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local posC    = getThingPosWithDebug(cid)
    local posT    = getThingPosWithDebug(target)

    -- Define efeito visual do gancho conforme forma do alvo
    local subName = getSubName(cid, target)
    local Shoot   = 38 -- padrão

    if spell == "Vine Hook" then
        if subName == "Tangrowth" then
            Shoot = 38 -- missiles
        elseif subName == "Tangela" then
            Shoot = 38 -- padrão
        else
            Shoot = 38 -- efeito verde (vine hook genérico)
        end
    end

    -- Disparo inicial do gancho
    sendDistanceShootWithProtect(cid, posC, posT, Shoot)

    -- Teleporta o alvo para perto do caster
    addEvent(doTeleportThing, 200, target, getClosestFreeTile(cid, posC), true)

    -- Disparo de retorno do gancho
    addEvent(sendDistanceShootWithProtect, 200, cid, posT, posC, Shoot)

    return true
end
