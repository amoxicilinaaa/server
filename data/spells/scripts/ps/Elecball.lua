dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local ret = {
        id = cid,
        cd = 15,
        eff = 14,
        check = 0,
        buff = spell,
        first = true
    }

    doCondition2(ret)

    local pos = getThingPosWithDebug(cid)
    pos.x = pos.x + 1
    pos.y = pos.y + 1

    local atk = {
        ["Elecball"] = {171, ELECTRICDAMAGE},
        --["Eruption"] = {241, FIREDAMAGE}
    }

    stopNow(cid, 1000)
    doSendMagicEffect(pos, atk[spell][1])
    doMoveInArea2(cid, 0, bombWee1, atk[spell][2], min, max, spell)

    return true
end