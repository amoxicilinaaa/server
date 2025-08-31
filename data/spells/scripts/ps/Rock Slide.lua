function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Tabela de efeitos por spell
    local atk = {
        ["Rock Slide"] = {11, 44, 0, 176, 70, 716} -- padrão, crystal, lava
        -- ["Stone Edge"] = {11, 239}
    }

    -- Define efeitos visuais conforme forma do alvo
    local name = getSubName(cid, target)
    local effD, eff

    if isInArray({
        "Numel", "Shiny Numel", "Camerupt", "Shiny Camerupt", "Mega Camerupt",
        "Magcargo", "Shiny Magcargo", "Slugma", "Shiny Slugma"
    }, name) then
        effD = atk[spell][5]
        eff  = atk[spell][6]
    elseif isInArray({"Crystal Onix", "Crystal Steelix"}, name) then
        effD = atk[spell][3]
        eff  = atk[spell][4]
    else
        effD = atk[spell][1]
        eff  = atk[spell][2]
    end

    -- Função que executa a queda da rocha
    local function doRockFall(cid, frompos, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos = getThingPosWithDebug(target)
        local ry = math.abs(frompos.y - pos.y)

        doSendDistanceShoot(frompos, pos, effD)
        addEvent(doDanoInTarget, ry * 15, cid, target, ROCKDAMAGE, min, max, eff)
    end

    -- Função que lança a rocha para cima
    local function doRockUp(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        local pos = getThingPosWithDebug(cid)
        local topos = {x = pos.x - 5, y = pos.y - 8, z = pos.z}

        doSendDistanceShoot(pos, topos, effD)
        addEvent(doRockFall, 8 * 49, cid, topos, target)
    end

    -- Ativa storage temporária
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)

    -- Executa dois lançamentos de rocha com delay
    for thnds = 1, 2 do
        addEvent(doRockUp, thnds * 155, cid, target)
    end

    return true
end
