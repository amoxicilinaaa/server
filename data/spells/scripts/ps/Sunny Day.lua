function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros da condição "Silence"
    local ret = {
        id    = 0,
        cd    = 6,
        check = 0,
        eff   = 513,
        cond  = "Silence",
        spell = spell
    }

    -- Efeito visual lateral
    local p = getThingPosWithDebug(cid)
    doSendMagicEffect({x = p.x + 1, y = p.y, z = p.z}, 828)

    -- Cura de status da ball se for summon
    if isSummon(cid) then
        local ball = getPlayerSlotItem(getCreatureMaster(cid), 8)
        doCureBallStatus(ball.uid, "all")
    end

    -- Buff exclusivo para Nuzleaf e Shiftry
    local cloro = {"Nuzleaf", "Shiftry"}
    if isInArray(cloro, getCreatureName(cid)) then
        doRaiseStatus(cid, 0, 0, 300, 5)
    end

    -- Transformação especial para Castform
    if getCreatureName(cid) == "Castform" then
        addEvent(doTransformCastform, 1350, cid, "Fire")
        setPlayerStorageValue(cid, 253, -1)
        local master = getCreatureMaster(cid)
        setPlayerStorageValue(master, 141410, 1)
        addEvent(setPlayerStorageValue, 2200, master, 141410, -1)
    end

    -- Cura de status do próprio Pokémon
    doCureStatus(cid, "all")

    -- Ativa foco
    setPlayerStorageValue(cid, 253, 1)

    -- Aplica dano em área com condição "Silence"
    doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)

    return true
end
