dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local posTarget = getThingPosWithDebug(target)
    local posCaster = getThingPosWithDebug(cid)

    if not isSleeping(target) then
        doSendMagicEffect(posTarget, 3)
        doSendAnimatedText(posTarget, "FAIL", 155)
        return true
    end

    -- Marca que o efeito foi ativado
    setPlayerStorageValue(cid, 95487, 1)

    -- Efeitos visuais e dano
    doSendMagicEffect(posCaster, 132)
    doSendDistanceShoot(posCaster, posTarget, 39)
    doDanoWithProtectWithDelay(cid, target, psyDmg, -min, -max, 138)

    return true
end