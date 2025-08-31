function onCastSpell(cid, var)
    -- Exibe texto flutuante "FOCUS" com cor 144
    doSendAnimatedText(getThingPosWithDebug(cid), "FOCUS", 144)

    -- Aplica efeito visual na posição do caster (ID 132)
    doSendMagicEffect(getThingPosWithDebug(cid), 132)

    -- Ativa storage 253, que pode ser usado para controle de estado
    setPlayerStorageValue(cid, 253, 1)

    --[[ 💡 Sugestão opcional: aplicar bônus no próximo ataque físico
    -- Este storage pode ser verificado na função de dano para aplicar multiplicador
    setPlayerStorageValue(cid, 99994, os.time() + 10) -- dura 10 segundos
    -- Pode ser resetado após o próximo ataque ou ao expirar
    -- Exemplo de uso: if os.time() <= getPlayerStorageValue(cid, 99994) then aplicar bônus
    --]]

    return true
end