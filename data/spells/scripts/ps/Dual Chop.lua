dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local ret = {
        id = target,
        cd = 8,
        eff = 43,
        check = getPlayerStorageValue(target, conds["Slow"]),
        first = true,
        cond = "Slow",
        spell = spell
    }

    local posT1 = getThingPosWithDebug(target)
    doSendMagicEffect(posT1, 475)
    doDanoWithProtect(cid, DRAGONDAMAGE, posT1, 0, -min, -max, 0)

    addEvent(doSendMagicEffect, 1500, posT1, 476)
    addEvent(doDanoWithProtect, 1500, cid, DRAGONDAMAGE, posT1, 0, -min, -max, 0)
    addEvent(doMoveDano2, 1, cid, target, DRAGONDAMAGE, 0, 0, ret, spell)

    return true
end