dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local ret = {
        id = 0,
        cd = 5,
        check = 0,
        eff = 88,
        spell = spell
    }

    local stunChance = math.random(1, 5)
    ret.cond = (stunChance >= 3) and "Stun" or nil

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    local posT = getThingPosWithDebug(target)
    local posTx1 = {x = posT.x + 1, y = posT.y, z = posT.z}
    doSendMagicEffect(posTx1, 572)

    doDanoWithProtectWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 39)
    addEvent(doMoveDano2, 50, cid, target, FIGHTINGDAMAGE, 0, 0, ret, spell)

    return true
end