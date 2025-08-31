function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local min     = spellData.min
    local max     = spellData.max
    local m       = spellData.m or 0 -- caso esteja usando modificador extra
    local stwing  = spellData.stwing or 0

    local name = getCreatureName(cid)
    local dmg = cannonBalls[name].damage

    -- Função para reaparecer e limpar storage
    local function doBack(cid)
        if not isCreature(cid) then return true end
        setPlayerStorageValue(cid, 9658783, -1)
        doAppear(cid)
    end

    -- Função que executa cada disparo
    local function doStartHit(cid, n, dir, pos, rote)
        if not isCreature(cid) or n == 9 then return true end

        local data = cannonBalls[name]
        local eff, eff2

        if dir == 0 then -- norte
            pos.y = pos.y + (n >= 5 and 1 or -1)
            eff = n >= 5 and data.edown or data.eup

            doSendMagicEffect(pos, eff)
            doDanoWithProtect(cid, dmg, {x = pos.x + 1, y = pos.y, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, {x = pos.x - 1, y = pos.y, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

            eff2 = rote == 1 and data.efdmg1 or data.efdmg2
            rote = rote == 1 and 0 or 1

            doSendMagicEffect(pos, eff2)
            doSendMagicEffect({x = pos.x + 1, y = pos.y, z = pos.z}, eff2)
            doSendMagicEffect({x = pos.x - 1, y = pos.y, z = pos.z}, eff2)

        elseif dir == 1 then -- leste
            pos.x = pos.x + (n < 5 and 1 or -1)
            eff = n < 5 and data.eright or data.eleft

            doSendMagicEffect(pos, eff)
            doDanoWithProtect(cid, dmg, {x = pos.x, y = pos.y + 1, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, {x = pos.x, y = pos.y - 1, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

            eff2 = rote == 1 and data.efdmg3 or data.efdmg4
            rote = rote == 1 and 0 or 1

            doSendMagicEffect(pos, eff2)
            doSendMagicEffect({x = pos.x, y = pos.y - 1, z = pos.z}, eff2)
            doSendMagicEffect({x = pos.x, y = pos.y + 1, z = pos.z}, eff2)

        elseif dir == 2 then -- sul
            pos.y = pos.y + (n < 5 and 1 or -1)
            eff = n < 5 and data.edown or data.eup

            doSendMagicEffect(pos, eff)
            doDanoWithProtect(cid, dmg, {x = pos.x + 1, y = pos.y, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, {x = pos.x - 1, y = pos.y, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

            eff2 = rote == 1 and data.efdmg1 or data.efdmg2
            rote = rote == 1 and 0 or 1

            doSendMagicEffect(pos, eff2)
            doSendMagicEffect({x = pos.x + 1, y = pos.y, z = pos.z}, eff2)
            doSendMagicEffect({x = pos.x - 1, y = pos.y, z = pos.z}, eff2)

        elseif dir == 3 then -- oeste
            pos.x = pos.x + (n >= 5 and 1 or -1)
            eff = n >= 5 and data.eright or data.eleft

            doSendMagicEffect(pos, eff)
            doDanoWithProtect(cid, dmg, {x = pos.x, y = pos.y + 1, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, {x = pos.x, y = pos.y - 1, z = pos.z}, stwing, -min, -max, 0)
            doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

            eff2 = rote == 1 and data.efdmg3 or data.efdmg4
            rote = rote == 1 and 0 or 1

            doSendMagicEffect(pos, eff2)
            doSendMagicEffect({x = pos.x, y = pos.y - 1, z = pos.z}, eff2)
            doSendMagicEffect({x = pos.x, y = pos.y + 1, z = pos.z}, eff2)
        end

        -- Próximo disparo
        addEvent(doStartHit, 150, cid, n + 1, dir, pos, rote)
    end

    -- Início da execução
    doCreatureSetHideHealth(cid, true)
    doSetCreatureOutfit(cid, {lookType = 2}, -1)
    setPlayerStorageValue(cid, 9658783, 1)

    doStartHit(cid, 0, getCreatureLookDir(cid), getThingPos(cid), 1)
    addEvent(doBack, 1400, cid)

    return true
end