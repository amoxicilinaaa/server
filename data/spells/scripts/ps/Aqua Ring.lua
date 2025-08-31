dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    if not isCreature(cid) then return false end

    local maxHealth = getCreatureMaxHealth(cid)
    local currentHealth = getCreatureHealth(cid)
    local min = math.floor(maxHealth * 0.75)
    local max = math.floor(maxHealth * 0.85)

    local function doHealArea(cid, min, max)
        if not isCreature(cid) then return end

        local amount = math.random(min, max)
        local healCap = maxHealth - getCreatureHealth(cid)

        if healCap <= 0 then return end

        if amount > healCap then
            amount = healCap
        end

        doCreatureAddHealth(cid, amount)
        doSendAnimatedText(getThingPosWithDebug(cid), "+" .. amount, 65)
    end

    -- Efeito visual da cura
    doSendMagicEffect(getThingPosWithDebug(cid), 574)

    -- Executa a cura
    doHealArea(cid, min, max)

    return true
end