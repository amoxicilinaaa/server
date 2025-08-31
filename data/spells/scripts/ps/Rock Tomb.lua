function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Parâmetros da condição "Slow"
    local ret = {
        id = target,
        cd = 9,
        eff = 0,
        check = getPlayerStorageValue(target, conds["Slow"]),
        first = true,
        cond = "Slow"
    }

    -- Função que executa a queda da rocha
    local function doRockFall(cid, frompos, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos = getThingPosWithDebug(target)
        local ry = math.abs(frompos.y - pos.y)

        doSendDistanceShoot(frompos, pos, 125)
        addEvent(doMoveDano2, ry * 11, cid, target, ROCKDAMAGE, min, max, ret, spell)
        addEvent(sendEffWithProtect, ry * 11, cid, pos, 157)
    end

    -- Função que lança a rocha para cima antes da queda
    local function doRockUp(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local posTarget = getThingPosWithDebug(target)
        local posCaster = getThingPosWithDebug(cid)

        local xrg = math.floor((posTarget.x - posCaster.x) / 2)
        local topos = {
            x = posCaster.x + xrg,
            y = posCaster.y - 7,
            z = posCaster.z
        }

        doSendDistanceShoot(posCaster, topos, 125)
        addEvent(doRockFall, 7 * 49, cid, topos, target)
    end

    -- Inicia a sequência com delay
    addEvent(doRockUp, 155, cid, target)

    return true
end
