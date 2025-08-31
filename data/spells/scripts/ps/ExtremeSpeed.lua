dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local atk = {
        ["Pursuit"] = {17, DARKDAMAGE, 105},
        ["ExtremeSpeed"] = {50, NORMALDAMAGE, 51},
        ["U-Turn"] = {19, BUGDAMAGE},
        ["Shell Attack"] = {45, BUGDAMAGE}
    }

    local pos = getThingPosWithDebug(cid)
    local p = getThingPosWithDebug(target)
    local newPos = getClosestFreeTile(target, p)

    local eff
    if getSubName(cid, target) == "Murkrow" then
        eff = 105
    else
        eff = getSubName(cid, target) == "Shiny Arcanine" and atk[spell][3] or atk[spell][1]
    end

    local damage = atk[spell][2]

    addEvent(doDisapear, 100, cid)
    doChangeSpeed(cid, -getCreatureSpeed(cid))
    addEvent(doAppear, 800, cid)

    addEvent(doSendMagicEffect, 300, pos, 211)
    addEvent(doSendDistanceShoot, 380, pos, p, eff)
    addEvent(doSendDistanceShoot, 380, newPos, p, eff)
    addEvent(doDanoInTarget, 380, cid, target, damage, -min, -max, 0)
    addEvent(doSendDistanceShoot, 760, p, pos, eff)
    addEvent(doSendMagicEffect, 810, pos, 211)
    addEvent(doRegainSpeed, 950, cid)

    addEvent(function()
        if isCreature(cid) then
            if isSummon(cid) then
                local oldpos = getThingPos(cid)
                local oldlod = getCreatureLookDir(cid)
                local master = getCreatureMaster(cid)
                local pk = getCreatureSummons(master)[1]
                doTeleportThing(pk, oldpos, false)
                doCreatureSetLookDir(pk, oldlod)
            else
                doAppear(cid)
            end
        end
    end, 950)

    return true
end