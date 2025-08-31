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

    if spell == "Light Screen" then
        -- Interrompe ações do caster por 2.7 segundos
        stopNow(cid, 2700)

        -- Impede movimento e aplica storage de silence
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1)

        -- Remove silence e libera movimento após 2.8 segundos
        addEvent(setPlayerStorageValue, 2800, cid, 32698, -1)
        addEvent(doCreatureSetNoMove, 2800, cid, false)

        -- Efeitos visuais em cascata na posição do caster
        local delays = {0, 494, 986, 1480, 1974, 2468, 2963}
        for _, delay in ipairs(delays) do
            addEvent(doSendMagicEffect, delay, posC1, 773)
        end
    end

    return true
end