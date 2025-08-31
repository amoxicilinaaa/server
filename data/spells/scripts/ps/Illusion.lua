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

    local team = {
        ["Misdreavus"] = "MisdreavusTeam",
        ["Shiny Stantler"] = "Shiny StantlerTeam",
        ["Stantler"] = "StantlerTeam",
    }

    -- Função que remove o summon com efeito visual
    local function RemoveTeam(cid)
        if isCreature(cid) then
            doSendMagicEffect(getThingPosWithDebug(cid), 211)
            doRemoveCreature(cid)
        end
    end

    -- Efeito visual recorrente enquanto a equipe estiver ativa
    local function sendEff(cid, master, t)
        if isCreature(cid) and isCreature(master) and t > 0 and #getCreatureSummons(master) >= 2 then
            doSendMagicEffect(getThingPosWithDebug(cid), 86, master)
            addEvent(sendEff, 1000, cid, master, t - 1)
        end
    end

    -- Verifica se o summon já está em modo temporário
    if getPlayerStorageValue(cid, 637500) >= 1 then
        return true
    end

    local master = getCreatureMaster(cid)
    local item = getPlayerSlotItem(master, 8)
    local life, maxLife = getCreatureHealth(cid), getCreatureMaxHealth(cid)
    local name = getItemAttribute(item.uid, "poke")
    local pos = getThingPosWithDebug(cid)
    local time = 5 -- duração da equipe temporária em segundos

    -- Salva a porcentagem de vida atual no item
    doItemSetAttribute(item.uid, "hp", (life / maxLife))

    -- Define número de membros da equipe
    local num = getSubName(cid, target) == "Misdreavus" and 3 or 2
    local pk = {}

    -- Teleporta o Pokémon principal para uma área segura
    doTeleportThing(cid, {x = 4, y = 3, z = 10}, true)

    -- Se o Pokémon tem equipe definida, invoca os membros
    if team[name] then
        pk[1] = cid
        for b = 2, num do
            pk[b] = doSummonCreature(team[name], pos)
            doConvinceCreature(master, pk[b])
        end

        -- Ajusta posição e atributos dos membros invocados
        for a = 1, num do
            addEvent(doTeleportThing, math.random(0, 5), pk[a], getClosestFreeTile(pk[a], pos), true)
            addEvent(doAdjustWithDelay, 5, master, pk[a], true, true, true)
            doSendMagicEffect(getThingPosWithDebug(pk[a]), 211)
        end

        -- Efeito visual recorrente no master
        sendEff(cid, master, time)

        -- Storage para controle de tempo
        setPlayerStorageValue(master, 637501, 1)
        addEvent(setPlayerStorageValue, time * 1000, master, 637501, -2)

        -- Marca os summons como temporários e agenda remoção
        setPlayerStorageValue(pk[2], 637500, 1)
        addEvent(RemoveTeam, time * 1000, pk[2])

        setPlayerStorageValue(pk[3], 637500, 1)
        addEvent(RemoveTeam, time * 1000, pk[3])

        -- Caso especial: Scizor invoca um quarto membro
        if getSubName(cid, target) == "Scizor" then
            setPlayerStorageValue(pk[4], 637500, 1)
            addEvent(RemoveTeam, time * 1000, pk[4])
        end
    end

    --[[ ?? FUTURO: Aplicar buff temporário no master enquanto a equipe estiver ativa
    local ret = {
        id = master,
        cd = time,
        eff = 0,
        check = 0,
        spell = "Team Boost",
        cond = "Speed Up",
        first = true
    }
    doCondition2(ret)
    --]]

    --[[ ?? FUTURO: Variação de equipe por forma (ex: Shiny MisdreavusTeam)
    if isShiny(cid) then
        team[name] = team[name] .. "Shiny"
    end
    --]]

    return true
end