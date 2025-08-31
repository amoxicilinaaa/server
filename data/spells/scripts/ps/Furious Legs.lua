function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Define os parâmetros do buff
    local ret = {}
    ret.id = cid          -- ID do caster
    ret.cd = 15           -- duração do buff em segundos
    ret.eff = 13          -- efeito visual do buff
    ret.check = 0         -- controle interno
    ret.buff = spell      -- nome da spell que ativou o buff
    ret.first = true      -- flag de primeira ativação

    -- Aplica o buff via sistema de condição
    doCondition2(ret)

    --[[ 💡 Sugestão opcional: ativar storage para influenciar o próximo ataque
    setPlayerStorageValue(cid, 99995, os.time() + 15)
    -- Esse storage pode ser verificado na função de dano para aplicar bônus
    -- Exemplo: if os.time() <= getPlayerStorageValue(cid, 99995) then aplicar multiplicador
    -- Pode ser resetado após o primeiro ataque ou ao expirar
    --]]

    return true
end