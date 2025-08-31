function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local pos = getPosfromArea(cid, heal)
    local poscid = getThingPosWithDebug(cid)

    for n = 1, #pos do
        local thing = {x = pos[n].x, y = pos[n].y, z = pos[n].z, stackpos = 253}
        local pid = getThingFromPosWithProtect(thing)
        local pospid = getThingPosWithDebug(pid)

        -- Efeito visual inicial
        doSendMagicEffect(pos[n], 12)

        if isCreature(pid) then
            local shouldLock =
                (isSummon(cid) and (isSummon(pid) or isPlayer(pid)) and canAttackOther(cid, pid) == "Cant") or
                (ehMonstro(cid) and ehMonstro(pid))

            if shouldLock then
                -- Paralisa ambos
                doCreatureSetNoMove(pid, true)
                doCreatureSetNoMove(cid, true)

                -- Ativa storage visual
                setPlayerStorageValue(pid, 9658783, 1)
                setPlayerStorageValue(cid, 9658783, 1)

                -- Loop de efeitos visuais
                for i = 0, 9 do
                    local delay = i * 800
                    addEvent(doSendMagicEffect, delay, pospid, 117)
                    addEvent(doSendMagicEffect, delay, poscid, 117)
                end

                -- Libera após 8 segundos
                addEvent(function()
                    if not isCreature(cid) then return true end
                    setPlayerStorageValue(pid, 9658783, -1)
                    setPlayerStorageValue(cid, 9658783, -1)
                    doCreatureSetNoMove(pid, false)
                    doCreatureSetNoMove(cid, false)
                end, 8000)
            end
        end
    end

    return true
end