function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Tabela de atributos por spell
    local atk = {
        ["Pursuit"]       = {17, DARKDAMAGE, 105},
        ["ExtremeSpeed"]  = {50, NORMALDAMAGE, 51},
        ["U-Turn"]        = {19, BUGDAMAGE},
        ["Shell Attack"]  = {45, BUGDAMAGE}
    }

    local pos     = getThingPosWithDebug(cid)
    local p       = getThingPosWithDebug(target)
    local newPos  = getClosestFreeTile(target, p)

    -- Define efeito visual
    local eff
    if getSubName(cid, target) == "Murkrow" then
        eff = 105
    elseif getSubName(cid, target) == "Shiny Arcanine" then
        eff = atk[spell][3]
    else
        eff = atk[spell][1]
    end

    local damage = atk[spell][2]

    -- Desaparece e remove velocidade
    addEvent(doDisapear, 100, cid)
    doChangeSpeed(cid, -getCreatureSpeed(cid))

    -- Reaparece após delay
    addEvent(doAppear, 800, cid)

    -- Efeitos visuais e disparo
    addEvent(doSendMagicEffect, 300, pos, 211)
    addEvent(doSendDistanceShoot, 380, pos, p, eff)
    addEvent(doSendDistanceShoot, 380, newPos, p, eff)
    addEvent(doDanoInTarget, 380, cid, target, damage, -min, -max, 0)
    addEvent(doSendDistanceShoot, 760, p, pos, eff)
    addEvent(doSendMagicEffect, 810, pos, 211)

    -- Recupera velocidade
    addEvent(doRegainSpeed, 950, cid)

    -- Reposiciona summon se necessário
    addEvent(function()
        if not isCreature(cid) then return end

        if isSummon(cid) then
            local oldpos = getThingPos(cid)
            local olddir = getCreatureLookDir(cid)
            local master = getCreatureMaster(cid)
            local pk = getCreatureSummons(master)[1]

            doTeleportThing(pk, oldpos, false)
            doCreatureSetLookDir(pk, olddir)
        else
            doAppear(cid)
        end
    end, 950)

    return true
end
