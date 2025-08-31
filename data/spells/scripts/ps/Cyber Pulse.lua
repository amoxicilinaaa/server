dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local skill = spellData.skill
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    -- Define tipo de dano
    local damage = skill == "Dark Ball" and DARKDAMAGE or psyDmg

    -- Define efeito visual e tipo de projétil
    local eff, shooT
    if spell == "Cyber Pulse" then
        eff = 11
        shooT = 3
    elseif spell == "Dark Ball" then
        eff = 718
        local subname = getSubName(cid, target)
        if isInArray({"Absol", "Mega Absol"}, subname) then
            shooT = 109
        else
            shooT = 100
        end
    else
        eff = 133
        shooT = 3
    end

    -- Função para disparar e aplicar dano
    local function doPulse(cid, eff)
        if not isCreature(cid) or not isCreature(target) then return end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), shooT)
        doDanoInTargetWithDelay(cid, target, damage, min, max, eff)
    end

    -- Disparo inicial
    addEvent(doPulse, 0, cid, eff)

    -- Disparo adicional para spells específicas
    if isInArray({"Psy Pulse", "Cyber Pulse"}, spell) then
        addEvent(doPulse, 250, cid, eff)
    end

    return true
end