function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local min     = spellData.min
    local max     = spellData.max

    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Parâmetros da condição Silence
    local ret = {
        id = 0,
        cd = 6,
        check = 0,
        eff = 1,
        cond = "Silence"
    }

    -- Função que executa a chuva de impactos
    local function doFall(cid)
        for rocks = 1, 42 do
            addEvent(fall, rocks * 35, cid, master, WATERDAMAGE, 98, 488)
            addEvent(fall, rocks * 43, cid, master, WATERDAMAGE, 98, 1)
        end
    end

    -- Função que cura status e aplica efeito de chuva
    local function doRain(cid)
        if isSummon(cid) then
            local ball = getPlayerSlotItem(getCreatureMaster(cid), 8).uid
            doCureBallStatus(ball, "all")
        end

        doCureStatus(cid, "all")
        setPlayerStorageValue(cid, 253, 1) -- Focus
        doSendMagicEffect(getThingPosWithDebug(cid), 132)
        doMoveInArea2(cid, 0, confusion, WATERDAMAGE, 0, 0, spell, ret)
    end

    -- Buff especial para Ludicolo
    if getCreatureName(cid) == "Ludicolo" then
        doRaiseStatus(cid, 0, 0, 300, 5)
    end

    -- Transformação especial para Castform
    if getCreatureName(cid) == "Castform" then
        addEvent(doTransformCastform, 1350, cid, "Water")
        setPlayerStorageValue(getCreatureMaster(cid), 141410, 1)
        addEvent(setPlayerStorageValue, 2200, getCreatureMaster(cid), 141410, -1)
    end

    -- Executa chuva e cura com delay
    addEvent(doFall, 200, cid)
    addEvent(doRain, 1000, cid)

    return true
end
