function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target

    -- Envia projétil visual do caster até o alvo (ID 174)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 174)

    -- Reduz status do caster: atk = 0, def = 10, spd = 0, duração = 60s
    doReduceStatus(cid, 0, 10, 0, 60)

    -- Efeitos visuais no caster e no alvo
    doSendMagicEffect(getThingPosWithDebug(cid), 989)
    doSendMagicEffect(getThingPosWithDebug(target), 989)

    --[[ 🌿 FUTURO: Efeito de drenagem (cura proporcional ao dano causado)
    local lifeBefore = getCreatureHealth(target)
    doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 152)
    local lifeAfter = getCreatureHealth(target)
    local drained = lifeBefore - lifeAfter
    if drained > 0 then
        doCreatureAddHealth(cid, drained)
        doSendAnimatedText(getThingPosWithDebug(cid), "+" .. drained, 32)
    end
    --]]

    --[[ 💥 FUTURO: Bônus contra tipo Fairy ou Grass
    if isCreature(target) and (isPokeType(target, "Fairy") or isPokeType(target, "Grass")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoInTargetWithDelay, 400, cid, target, POISONDAMAGE, bonusMin, bonusMax, 152)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🐢 FUTURO: Aplicar lentidão no alvo por 5 segundos
    local slowEffect = {
        id = target,
        cd = 5,
        eff = 0,
        check = 0,
        buff = "Slowed",
        first = true
    }
    doCondition2(slowEffect)
    --]]

    return true
end