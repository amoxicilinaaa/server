function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC1 = spellData.posC1

    -- Light Screen: paralisa, aplica silence e efeitos visuais em cascata
    if spell == "Light Screen" then
        stopNow(cid, 2700)
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1)
        addEvent(setPlayerStorageValue, 2800, cid, 32698, -1)
        addEvent(doCreatureSetNoMove, 2800, cid, false)

        local delays = {0, 494, 986, 1480, 1974, 2468, 2963}
        for _, delay in ipairs(delays) do
            addEvent(doSendMagicEffect, delay, posC1, 773)
        end
    end

    -- Acid Armor: efeito visual único
    if spell == "Acid Armor" then
        doSendMagicEffect(posC1, 853)
    end

    -- Buffs via doCondition2
    local ret = {
        id = cid,
        cd = 8,
        eff = 0,
        check = 0,
        buff = spell,
        first = true
    }

    if spell == "Protect" then
        ret.cd = 5
        ret.eff = 0

    elseif spell == "Magnetic Flux" then
        ret.cd = 20
        ret.eff = 890

    elseif spell == "Light Screen" then
        ret.cd = 3
        ret.eff = 0
    end

    doCondition2(ret)

    return true
end