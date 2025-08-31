function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local skill = spellData.skill
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Define tipo de dano
    local damage = skill == "Dark Ball" and DARKDAMAGE or psyDmg

    -- Define efeito visual e tipo de projétil
    local eff, shooT
    if spell == "Cyber Pulse" then
        eff = 11
        shooT = 3

    elseif spell == "Dark Ball" then
        eff = 718
        if isInArray({"Absol", "Mega Absol"}, getSubName(cid, target)) then
            shooT = 109
        else
            shooT = 100
        end

    else
        eff = 133
        shooT = 3
    end

    -- Função que envia projétil e aplica dano com efeito
    local function doPulse(cid, eff)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), shooT)
        doDanoInTargetWithDelay(cid, target, damage, min, max, eff)
    end

    -- Execução imediata
    addEvent(doPulse, 0, cid, eff)

    -- Execução adicional para spells psíquicas
    if isInArray({"Psy Pulse", "Cyber Pulse"}, spell) then
        addEvent(doPulse, 250, cid, eff)
    end

    return true
end
