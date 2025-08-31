function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Ativa storage temporário para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)

    -- Função que executa a queda do projétil
    local function doSludgeFall(cid, frompos, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos = getThingPosWithDebug(target)
        local ry = math.abs(frompos.y - pos.y)
        doSendDistanceShoot(frompos, pos, 6)
        addEvent(doDanoInTargetWithDelay, ry * 11, cid, target, POISONDAMAGE, min, max, 845)
    end

    -- Função que calcula a posição aérea e dispara
    local function doSludgeUp(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos  = getThingPosWithDebug(target)
        local mps  = getThingPosWithDebug(cid)
        local xrg  = math.floor((pos.x - mps.x) / 2)
        local topos = {x = mps.x + xrg, y = mps.y - 7, z = mps.z}

        doSendDistanceShoot(mps, topos, 6)
        addEvent(doSludgeFall, 7 * 49, cid, topos, target)
    end

    -- Executa dois disparos com delay
    for thnds = 1, 2 do
        addEvent(doSludgeUp, thnds * 155, cid, target)
    end

    return true
end
