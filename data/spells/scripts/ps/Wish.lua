function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Calcula valores de cura com base na vida máxima
    local min = (getCreatureMaxHealth(cid) * 40) / 100
    local max = (getCreatureMaxHealth(cid) * 65) / 100

    -- Função de cura com texto animado
    local function doHealArea(target, min, max)
        if not isCreature(target) then return end
        local amount = math.random(min, max)
        local current = getCreatureHealth(target)
        local maxhp  = getCreatureMaxHealth(target)

        if current + amount > maxhp then
            amount = -(current - maxhp)
        end

        if current < maxhp then
            doCreatureAddHealth(target, amount)
            doSendAnimatedText(getThingPosWithDebug(target), "+" .. amount, 65)
        end
    end

    -- Aplica cura e buff no caster
    doHealArea(cid, min, max)
    doRaiseStatus(cid, 0, 0, 300, 10)

    -- Aplica efeito visual no centro
    local posC1 = getThingPosWithDebug(cid)
    doSendMagicEffect(posC1, 579)

    -- Aplica cura e buff em aliados na área
    local posList = getPosfromArea(cid, wish)
    for i = 1, #posList do
        local pos = {x = posList[i].x, y = posList[i].y, z = posList[i].z, stackpos = 253}
        local pid = getThingFromPosWithProtect(pos)

        if isCreature(pid) then
            if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                if canAttackOther(cid, pid) == "Cant" then
                    doHealArea(pid, min, max)
                    doRaiseStatus(pid, 0, 0, 300, 10)
                end
            elseif ehMonstro(cid) and ehMonstro(pid) then
                doHealArea(pid, min, max)
                doRaiseStatus(pid, 0, 0, 300, 10)
            end
        end
    end

    return true
end
