function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local pos     = getThingPosWithDebug(cid)

    -- Define efeito visual e tipo de dano por nome da spell
    local eff = spell == "Night Daze" and 222 or 113
    local dmg = spell == "Night Daze" and DARKDAMAGE or FIGHTINGDAMAGE

    -- Define outfit temporário para Hitmontop
    local name = getSubName(cid, target)
    local out = name == "Hitmontop" and 1193 or 1451

    -- Função para enviar bolha visual
    local function doSendBubble(cid, pos)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 27)
        doSendMagicEffect(pos, eff)
    end

    -- Dispersão de bolhas aleatórias
    for a = 1, 20 do
        local r1 = math.random(-4, 4)
        local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
        local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
        addEvent(doSendBubble, a * 25, cid, lugar)
    end

    -- Troca de outfit temporária para Hitmontop
    if isInArray({"Hitmontop", "Shiny Hitmontop"}, name) then
        doSetCreatureOutfit(cid, {lookType = out}, 400)
    end

    -- Aplica dano em área
    addEvent(doDanoWithProtect, 150, cid, dmg, pos, waterarea, -min, -max, 0)

    return true
end
