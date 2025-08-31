function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC = spellData.posC

    -- Define valores de cura proporcional à vida máxima
    local min = (getCreatureMaxHealth(cid) * 50) / 100
    local max = (getCreatureMaxHealth(cid) * 60) / 100

    -- Função que aplica cura e texto animado
    local function doHealArea(target, min, max)
        if not isCreature(target) then return end
        local amount = math.random(min, max)
        local current = getCreatureHealth(target)
        local maxhp = getCreatureMaxHealth(target)

        if current < maxhp then
            if current + amount > maxhp then
                amount = -(current - maxhp)
            end
            doCreatureAddHealth(target, amount)
            doSendAnimatedText(getThingPosWithDebug(target), "+" .. amount, 65)
        end
    end

    -- Aplica cura no caster
    doHealArea(cid, min, max)

    -- Verifica criaturas na área e aplica cura se forem aliados
    local posList = getPosfromArea(cid, heal)
    for i = 1, #posList do
        local pos = posList[i]
        local thing = {x = pos.x, y = pos.y, z = pos.z, stackpos = 253}
        local pid = getThingFromPosWithProtect(thing)

        doSendMagicEffect(pos, 12)

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