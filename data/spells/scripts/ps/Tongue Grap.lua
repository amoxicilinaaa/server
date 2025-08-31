function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max
    local damage  = NORMALDAMAGE
    local eff     = 185

    -- Condição "Silence"
    local ret = {
        id    = target,
        cd    = 4,
        check = getPlayerStorageValue(target, conds["Silence"]),
        eff   = eff,
        cond  = "Silence",
        spell = spell
    }

    -- Disparo inicial
    sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 38)

    -- Aplica dano com condição
    addEvent(doMoveDano2, 100, cid, target, damage, 0, 0, ret, spell)

    -- Função de disparo reverso
    local function distEff(cid, target)
        if not isCreature(cid) or not isCreature(target) or not isSilence(target) then return true end
        sendDistanceShootWithProtect(cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 38)
    end

    -- Função de pulso de dano
    local function doPulse(cid, eff)
        if not isCreature(cid) then return true end
        doDanoInTargetWithDelay(cid, target, damage, min, max, 0)
    end

    -- Função de restauração de velocidade
    local function voltar(cid, target)
        if not isCreature(cid) then return true end
        doRegainSpeed(cid)
        doRegainSpeed(target)
    end

    -- Executa 15 pulsos com disparos reversos e paralisação temporária
    for i = 1, 15 do
        addEvent(distEff, i * 250, cid, target)
        addEvent(doPulse, i * 250, cid, eff)
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        doChangeSpeed(target, -getCreatureSpeed(target))
        addEvent(voltar, 3700, cid, target)
    end

    return true
end
