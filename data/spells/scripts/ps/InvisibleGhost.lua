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

    -- Desaparece o caster
    doDisapear(cid)

    -- Reaparece após 4 segundos
    addEvent(doAppear, 4000, cid)

    -- Ativa proteção contra dano
    setPlayerStorageValue(cid, 9658783, 1)

    -- Efeito visual de teleporte
    local eff = 134 -- pode ser substituído por 386 se necessário
    doSendMagicEffect(getThingPosWithDebug(cid), eff)

    -- Após 4 segundos, remove proteção e reposiciona summon se necessário
    addEvent(function()
        if isCreature(cid) then
            setPlayerStorageValue(cid, 9658783, -1)

            if isSummon(cid) then
                local oldpos = getThingPos(cid)
                local oldlod = getCreatureLookDir(cid)
                local master = getCreatureMaster(cid)
                local pk = getCreatureSummons(master)[1]

                doTeleportThing(pk, oldpos, false)
                doCreatureSetLookDir(pk, oldlod)
            else
                doAppear(cid)
            end
        end
    end, 4000)

    return true
end