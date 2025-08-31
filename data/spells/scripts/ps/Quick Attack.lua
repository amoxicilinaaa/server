function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max
    local posT    = getThingPosWithDebug(target)

    -- Dano direto com efeito visual 968
    doDanoWithProtect(cid, NORMALDAMAGE, posT, 0, -min, -max, 968)

    --[[
    -- Versão alternativa para Blaziken (descomente para ativar)
    if getSubName(cid, target) == "Blaziken" then
        doSendMagicEffect(getThingPosWithDebug(cid), 211)
        doSendDistanceShoot(getThingPosWithDebug(cid), posT, 10)
        doDisapear(cid)
        addEvent(doAppear, 150, cid)

        local x = getClosestFreeTile(cid, posT)
        doTeleportThing(cid, x, false)
        doFaceCreature(cid, getThingPosWithDebug(cid))

        doTargetCombatHealth(cid, target or 0, NORMALDAMAGE, -min, -max, 3)
    else
        doSendMagicEffect(getThingPosWithDebug(cid), 211)
        local x = getClosestFreeTile(cid, posT)
        doTeleportThing(cid, x, false)
        doFaceCreature(cid, getThingPosWithDebug(cid))
        doTargetCombatHealth(cid, target or 0, NORMALDAMAGE, -min, -max, 3)
    end
    ]]

    return true
end