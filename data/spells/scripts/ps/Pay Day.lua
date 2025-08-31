function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Função que executa o disparo descendente e aplica dano com delay proporcional
    local function doThunderFall(cid, frompos, target)
        if not isCreature(target) or not isCreature(cid) then return true end
        local pos = getThingPosWithDebug(target)
        local ry = math.abs(frompos.y - pos.y)
        doSendDistanceShoot(frompos, pos, 39)
        addEvent(doDanoInTarget, ry * 11, cid, target, NORMALDAMAGE, min, max, 28)
    end

    -- Função que calcula posição acima do alvo e inicia o disparo ascendente
    local function doThunderUp(cid, target)
        if not isCreature(target) or not isCreature(cid) then return true end
        local pos = getThingPosWithDebug(target)
        local mps = getThingPosWithDebug(cid)
        local xrg = math.floor((pos.x - mps.x) / 2)
        local topos = {x = mps.x + xrg, y = mps.y - 7, z = mps.z}
        doSendDistanceShoot(mps, topos, 39)
        addEvent(doThunderFall, 7 * 49, cid, topos, target)
    end

    -- Ativa storage temporário para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)

    -- Executa dois disparos ascendentes com delay
    for thnds = 1, 2 do
        addEvent(doThunderUp, thnds * 155, cid, target)
    end

    return true
end