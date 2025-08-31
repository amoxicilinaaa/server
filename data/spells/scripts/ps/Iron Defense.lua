function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Light Screen: impede movimento e aplica silence temporário com efeito recorrente
    if spell == "Light Screen" then
        stopNow(cid, 2700)

        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 2800, cid, 32698, -1)
        addEvent(doCreatureSetNoMove, 2800, cid, false)

        -- Efeitos visuais em sequência
        local delays = {0, 494, 986, 1480, 1974, 2468, 2963}
        for _, delay in ipairs(delays) do
            addEvent(doSendMagicEffect, delay, posC1, 773)
        end
    end

    -- Acid Armor: efeito visual único
    if spell == "Acid Armor" then
        doSendMagicEffect(posC1, 853)
    end

    -- Buffs com duração e efeito visual definidos
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
        ret.eff = 0 -- visual tratado em sistema externo
        doCondition2(ret)

    elseif spell == "Magnetic Flux" then
        ret.cd = 20
        ret.eff = 890
        doCondition2(ret)

    elseif spell == "Light Screen" then
        ret.cd = 3
        ret.eff = 0
        doCondition2(ret)

    else
        doCondition2(ret)
    end

    return true
end