function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Tabela de efeitos visuais por forma
    local atk = {
        ["Rock Throw"] = {11, 44, 0, 176, 70, 716} -- padrão, crystal, lava
    }

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

    -- Executa disparo visual e aplica dano tipo ROCK
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), effD)
    doDanoInTargetWithDelay(cid, target, ROCKDAMAGE, min, max, eff)

    return true
end
