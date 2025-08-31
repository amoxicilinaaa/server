function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local eff1    = 413
    local eff2    = 48
    local eff3    = 207
    local shoot1  = 41

    -- Efeitos visuais adaptados por forma do alvo
    local subName = getSubName(cid, target)
    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        eff1   = 639
        eff2   = 641
        eff3   = 40
        shoot1 = 90
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        eff1   = 977
        eff2   = 979
        eff3   = 207
        shoot1 = 170
    end

    -- Função que executa o raio descendente
    local function doThunderFall(cid, frompos, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos = getThingPosWithDebug(target)
        local ry  = math.abs(frompos.y - pos.y)

        doSendDistanceShoot(frompos, pos, shoot1)
        addEvent(doDanoInTarget, ry * 11, cid, target, ELECTRICDAMAGE, min, max, 0)
        addEvent(doSendMagicEffect, ry * 30, pos, eff2)
        addEvent(doSendMagicEffect, ry * 7, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, eff1)
    end

    -- Função que inicia o raio aéreo
    local function doThunderUp(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos   = getThingPosWithDebug(cid)
        local xrg   = math.floor((pos.x - 1 - pos.x - 6)) -- -7
        local topos = {x = pos.x + xrg, y = pos.y - 8, z = pos.z}

        doSendDistanceShoot(pos, topos, shoot1)
        addEvent(doThunderFall, 8 * 49, cid, topos, target)
    end

    -- Proteção temporária contra sobreposição
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)

    -- Executa dois raios com efeitos visuais
    for thnds = 1, 2 do
        addEvent(doThunderUp, thnds * 155, cid, target)
        doSendMagicEffect(getThingPosWithDebug(cid), 207)
        addEvent(doSendMagicEffect, 30, getThingPosWithDebug(cid), eff3)
        addEvent(doSendMagicEffect, 5, getThingPosWithDebug(cid), 728)
        addEvent(doSendMagicEffect, 15, getThingPosWithDebug(cid), 728)
        addEvent(doSendMagicEffect, 28, getThingPosWithDebug(cid), 728)
    end

    return true
end
