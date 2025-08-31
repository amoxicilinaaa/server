function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local posC    = getThingPosWithDebug(cid)
    local posC1   = {x = posC.x + 1, y = posC.y, z = posC.z}
    local dir     = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p       = getThingPosWithDebug(cid)

    local t = {
        [0] = {364, {x = p.x + 1, y = p.y - 1, z = p.z}, 0, -5},
        [1] = {361, {x = p.x + 5, y = p.y + 1, z = p.z}, 5, 0},
        [2] = {363, {x = p.x + 1, y = p.y + 5, z = p.z}, 0, 5},
        [3] = {362, {x = p.x - 1, y = p.y + 1, z = p.z}, -5, 0},
    }

    local qualDano = DRAGONDAMAGE

    -- Variações por nome da spell
    -- (tabela t e qualDano são redefinidos conforme o nome da spell)
    -- ... [todas as variações que você já definiu] ...

    -- Efeito de portal para Nuzzle
    if spell == "Nuzzle" then
        doSendMagicEffect(posC, 355)
    end

    -- Execução da spell
    if spell == "Shadow Sneak" then
        doSendMagicEffect(posC1, 697)
        doMoveInArea2(cid, 0, reto5, qualDano, min, max, spell)
        addEvent(doSendMagicEffect, 30, t[dir][2], t[dir][1])
    else
        doMoveInArea2(cid, 0, triplo6, qualDano, min, max, spell)
        doSendMagicEffect(t[dir][2], t[dir][1])
    end

    -- Efeito de desaparecimento e teleport
    local pos = getThingPos(cid)
    doSendMagicEffect(pos, 307)
    doDisapear(cid)

    pos.x = pos.x + t[dir][3]
    pos.y = pos.y + t[dir][4]

    -- Função que executa teleport e reaparecimento
    local function doTeleportMe(cid, pos)
        if not isCreature(cid) then return true end
        if canWalkOnPos(pos, false, true, true, true, true) then
            doTeleportThing(cid, pos)
        end

        if spell == "Fenix Dash" then
            addEvent(doAppear, 450, cid)
        else
            doAppear(cid)
        end

        local megaID = getPlayerStorageValue(cid, storages.isMega)
        if megaID == "Mega Ampharos" then
            doPantinOutfit(cid, 0, megaID)
        elseif isMega(cid) then
            local conf = megasConf[megaID]
            if conf and conf.out then
                doSetCreatureOutfit(cid, {lookType = conf.out}, -1)
                checkOutfitMega(cid, megaID)
            end
        end
    end

    -- Executa teleport com delay
    addEvent(doTeleportMe, 300, cid, pos)

    return true
end
