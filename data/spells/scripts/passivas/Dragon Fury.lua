function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target

    -- Evita repetição se já estiver ativo
    if getPlayerStorageValue(cid, 32623) == 1 then
        return true
    end

    -- Ativa storage de controle
    setPlayerStorageValue(cid, 32623, 1)

    -- Aplica buff de status conforme forma do alvo
    if isInArray({"Persian", "Raticate", "Shiny Raticate"}, getSubName(cid, target)) then
        doRaiseStatus(cid, 2, 0, 0, 10)
    else
        doRaiseStatus(cid, 2, 2, 0, 10)
    end

    -- Executa efeitos visuais em sequência
    for t = 1, 7 do
        addEvent(sendMoveEffect, t * 1500, cid, 12)
    end

    -- Reseta storage após 10.5 segundos
    addEvent(setPlayerStorageValue, 10500, cid, 32623, 0)

    return true
end
