function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local min     = spellData.min
    local max     = spellData.max

    local master  = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Parâmetros da condição "Silence"
    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 34,
        cond = "Silence",
        spell = spell
    }

    -- Função que executa a queda de rochas
    local function doFall(cid)
        if not isCreature(cid) then return end
        for rocks = 1, 42 do
            addEvent(fall, rocks * 35, cid, master, GROUNDDAMAGE, 22, 158)
        end
    end

    -- Função que cura status e aplica efeito em área
    local function doRain(cid)
        if not isCreature(cid) then return end

        -- Cura status do Pokémon e da Pokéball
        if isSummon(cid) then
            local ball = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doCureBallStatus(ball.uid, "all")
        end
        doCureStatus(cid, "all")

        -- Aplica efeito visual e storage de foco
        setPlayerStorageValue(cid, 253, 1)
        doSendMagicEffect(getThingPosWithDebug(cid), 132)

        -- Aplica dano em área com condição Silence
        doMoveInArea2(cid, 0, confusion, GROUNDDAMAGE, min, max, spell, ret)
    end

    -- Executa sequência com delay
    addEvent(doFall, 200, cid)
    addEvent(doRain, 1000, cid)

    return true
end