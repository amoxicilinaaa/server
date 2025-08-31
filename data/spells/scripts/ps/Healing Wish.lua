function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Define valores de cura com base na vida máxima do caster
    local min = (getCreatureMaxHealth(cid) * 40) / 100
    local max = (getCreatureMaxHealth(cid) * 65) / 100

    -- Função que cura o alvo e exibe texto animado
    local function doHealArea(cid, min, max)
        local amount = math.random(min, max)
        if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
            amount = -(getCreatureHealth(cid) - getCreatureMaxHealth(cid))
        end
        if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
            doCreatureAddHealth(cid, amount)
            doSendAnimatedText(getThingPosWithDebug(cid), "+" .. amount, 65)
        end
    end

    -- Função que remove condições negativas
    local function doCure(cid)
        if not isCreature(cid) then return true end
        if isSummon(cid) then
            doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
        end
        doCureStatus(cid, "all")
    end

    -- Posições da área de efeito
    local pos = getPosfromArea(cid, HealWish)
    local n = 0

    -- Cura e remove status do caster
    doHealArea(cid, min, max)
    doCure(cid)

    -- Aplica cura e efeitos visuais na área
    while n < #pos do
        n = n + 1
        local thing = {x = pos[n].x, y = pos[n].y, z = pos[n].z, stackpos = 253}
        local pid = getThingFromPosWithProtect(thing)

        doSendMagicEffect(pos[n], 13)
        addEvent(doSendMagicEffect, 200, pos[n], 14)

        if isCreature(pid) then
            if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                if canAttackOther(cid, pid) == "Cant" then
                    doHealArea(pid, min, max)
                    -- doCure(pid)
                end
            elseif ehMonstro(cid) and ehMonstro(pid) then
                doHealArea(pid, min, max)
                -- doCure(pid)
            end
        end
    end

    return true
end