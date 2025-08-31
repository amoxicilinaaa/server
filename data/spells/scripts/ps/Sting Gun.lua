function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Função que dispara projétil e aplica dano
    local function doGun(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 13)
        doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 8)
    end

    -- Ativa storage temporário para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 200, cid, 3644587, 1)

    -- Executa 3 disparos com delay
    for i = 0, 2 do
        addEvent(doGun, i * 100, cid, target)
    end

    return true
end
