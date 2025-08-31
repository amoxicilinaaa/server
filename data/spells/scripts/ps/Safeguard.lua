function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Efeito visual de purificação
    doSendMagicEffect(getThingPosWithDebug(cid), 1)

    -- Se for summon, limpa os status da Pokéball
    if isSummon(cid) then
        local master = getCreatureMaster(cid)
        local ball = getPlayerSlotItem(master, 8)
        doCureBallStatus(ball.uid, "all")
    end

    -- Limpa todos os status do Pokémon
    doCureStatus(cid, "all")

    return true
end