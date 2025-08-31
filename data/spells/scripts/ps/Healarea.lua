function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = (getCreatureMaxHealth(cid) * 40) / 100
    local max = (getCreatureMaxHealth(cid) * 65) / 100
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

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

    -- Posições da área de cura
    local pos = getPosfromArea(cid, heal)
    local n = 0

    -- Cura o caster
    doHealArea(cid, min, max)

    -- Aplica cura e efeito visual nos aliados da área
    while n < #pos do
        n = n + 1
        local thing = {x = pos[n].x, y = pos[n].y, z = pos[n].z, stackpos = 253}
        local pid = getThingFromPosWithProtect(thing)

        doSendMagicEffect(pos[n], 12)

        if isCreature(pid) then
            if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                if canAttackOther(cid, pid) == "Cant" then
                    doHealArea(pid, min, max)
                end
            elseif ehMonstro(cid) and ehMonstro(pid) then
                doHealArea(pid, min, max)
            end
        end
    end

    return true
end