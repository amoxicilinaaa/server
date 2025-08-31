dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local pos = getThingPos(cid)
    local dir = getCreatureLookDir(cid)
    local name = getCreatureName(cid)
    local config = cannonBalls[name]
    if not config then return false end

    local dmg = config.damage

    -- Função para restaurar estado
    local function doBack(cid)
        if isCreature(cid) then
            setPlayerStorageValue(cid, 9658783, -1)
            doAppear(cid)
        end
    end

    -- Função para executar cada estágio do bombardeio
    local function doStartHit(cid, n, dir, pos, rote)
        if not isCreature(cid) or n == 9 then return end

        local eff, eff2

        if dir == 0 or dir == 2 then
            pos.y = pos.y + ((dir == 0 and n >= 5) or (dir == 2 and n < 5) and 1 or -1)
            eff = (dir == 0 and n >= 5) or (dir == 2 and n < 5) and config.edown or config.eup
            doSendMagicEffect(pos, eff)
            doDanoWithProtect(cid, dmg, {x = pos.x + 1, y = pos.y, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, {x = pos.x - 1, y = pos.y, z = pos.z}, stwing, -min, -max, 0)
        elseif dir == 1 or dir == 3 then
            pos.x = pos.x + ((dir == 1 and n < 5) or (dir == 3 and n >= 5) and 1 or -1)
            eff = (dir == 1 and n < 5) or (dir == 3 and n >= 5) and config.eright or config.eleft
            doSendMagicEffect(pos, eff)
            doDanoWithProtect(cid, dmg, {x = pos.x, y = pos.y + 1, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, {x = pos.x, y = pos.y - 1, z = pos.z}, stwing, -min, -max, 0)
        end

        doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

        -- Alternância de efeitos visuais
        if rote == 1 then
            rote = 0
            eff2 = (dir == 0 or dir == 2) and config.efdmg1 or config.efdmg3
        else
            rote = 1
            eff2 = (dir == 0 or dir == 2) and config.efdmg2 or config.efdmg4
        end

        doSendMagicEffect(pos, eff2)
        if dir == 0 or dir == 2 then
            doSendMagicEffect({x = pos.x + 1, y = pos.y, z = pos.z}, eff2)
            doSendMagicEffect({x = pos.x - 1, y = pos.y, z = pos.z}, eff2)
        else
            doSendMagicEffect({x = pos.x, y = pos.y + 1, z = pos.z}, eff2)
            doSendMagicEffect({x = pos.x, y = pos.y - 1, z = pos.z}, eff2)
        end

        -- Próximo estágio
        addEvent(doStartHit, 100, cid, n + 1, dir, pos, rote)
    end

    -- Início da animação
    doCreatureSetHideHealth(cid, true)
    doSetCreatureOutfit(cid, {lookType = 2}, -1)
    setPlayerStorageValue(cid, 9658783, 1)
    doStartHit(cid, 0, dir, pos, 1)
    addEvent(doBack, 900, cid)

    return true
end