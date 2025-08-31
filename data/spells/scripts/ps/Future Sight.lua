function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC1 = spellData.posC1 or getThingPosWithDebug(cid)

    -- Light Screen: impede movimento e aplica efeitos visuais em sequência
    if spell == "Light Screen" then
        stopNow(cid, 2700)
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1) -- silence
        addEvent(setPlayerStorageValue, 2800, cid, 32698, -1)
        addEvent(doCreatureSetNoMove, 2800, cid, false)

        -- Efeitos visuais em sequência
        local delays = {0, 494, 986, 1480, 1974, 2468, 2963}
        for _, delay in ipairs(delays) do
            addEvent(doSendMagicEffect, delay, posC1, 773)
        end

        -- Buff secundário de Light Screen
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

    --[[ 💡 Sugestão opcional: aplicar escudo temporário que reduz dano recebido
    if spell == "Protect" then
        setPlayerStorageValue(cid, 99996, os.time() + 5)
        -- Esse storage pode ser verificado na função de dano para aplicar redução
        -- Exemplo: if os.time() <= getPlayerStorageValue(cid, 99996) then reduzir dano em 50%
    end
    --]]

    return true
end