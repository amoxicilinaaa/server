dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC1 = spellData.posC1

    if spell == "Light Screen" then
        -- Efeito de silêncio e paralisação temporária
        stopNow(cid, 2700)
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1)
        addEvent(setPlayerStorageValue, 2800, cid, 32698, -1)
        addEvent(doCreatureSetNoMove, 2800, cid, false)

        -- Efeitos visuais em sequência
        local delays = {0, 494, 986, 1480, 1974, 2468, 2963}
        for _, delay in ipairs(delays) do
            addEvent(doSendMagicEffect, delay, posC1, 773)
        end

        -- Buff adicional via condição
        local ret = {
            id = cid,
            cd = 3,
            eff = 0,
            check = 0,
            buff = spell,
            first = true
        }
        doCondition2(ret)

    elseif spell == "Acid Armor" then
        doSendMagicEffect(posC1, 853)

    elseif spell == "Protect" then
        local ret = {
            id = cid,
            cd = 5,
            eff = 0,
            check = 0,
            buff = spell,
            first = true
        }
        doCondition2(ret)

    elseif spell == "Magnetic Flux" then
        local ret = {
            id = cid,
            cd = 20,
            eff = 890,
            check = 0,
            buff = spell,
            first = true
        }
        doCondition2(ret)

    else
        -- Fallback para outras spells com buff genérico
        local ret = {
            id = cid,
            cd = 8,
            eff = 0,
            check = 0,
            buff = spell,
            first = true
        }
        doCondition2(ret)
    end
    return true
end