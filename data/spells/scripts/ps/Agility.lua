dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC = spellData.posC

    local ret = {
        id = cid,
        cd = 15,
        eff = spell == "Speed Boost" and 782 or 14,
        check = 0,
        buff = spell,
        first = true
    }

    doCondition2(ret)

    if spell == "Speed Boost" then
        doSendMagicEffect(posC, 29)
        doChangeSpeed(cid, getCreatureSpeed(cid)) -- aplica boost
        addEvent(doRegainSpeed, 6450, cid)        -- remove após 6.45s
    end
    return true
end