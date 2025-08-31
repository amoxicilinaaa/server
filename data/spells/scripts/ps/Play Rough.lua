function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posT = getThingPosWithDebug(target)

    -- Condição Paralyze
    local ret = {
        id = target,
        cd = 1,
        eff = 440,
        check = 0,
        first = true,
        cond = "Paralyze"
    }

    -- Condição Silence
    local ret2 = {
        id = target,
        cd = 1,
        check = 0,
        eff = 440,
        spell = spell,
        cond = "Silence"
    }

    -- Efeito inicial no caster
    doSendMagicEffect(getThingPosWithDebug(cid), 211)

    -- Aplica Paralyze com dano
    doMoveDano2(cid, target, NORMALDAMAGE, min, max, ret, spell)

    -- Dano adicional com delay
    addEvent(doDanoInTargetWithDelay, 200, cid, target, NORMALDAMAGE, min, max, 0)

    -- Aplica Silence sem dano
    doMoveDano2(cid, target, NORMALDAMAGE, 0, 0, ret2, spell)

    -- Teleporte do caster para posição próxima ao alvo
    local xx = getClosestFreeTile(cid, getThingPosWithDebug(target))
    doTeleportThing(cid, xx, false)
    doFaceCreature(cid, getThingPosWithDebug(cid))

    -- Ativa storage de Silence temporariamente
    setPlayerStorageValue(cid, 32698, 1)
    addEvent(setPlayerStorageValue, 1200, cid, 32698, -1)

    -- Paralisação e desaparecimento temporário
    addEvent(stopNow, 20, cid, 1100)
    addEvent(doDisapear, 30, cid)
    addEvent(doAppear, 1040, cid)

    -- Efeitos visuais na posição do alvo
    doSendMagicEffect(posT, 3)
    doSendMagicEffect(posT, 507)
    doSendMagicEffect(posT, 142)
    doSendMagicEffect(posT, 440)
    doSendMagicEffect(posT, 148)
    addEvent(doSendMagicEffect, 50, posT, 440)

    return true
end