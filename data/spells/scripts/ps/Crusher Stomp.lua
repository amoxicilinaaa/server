dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Define posições laterais
    local p = getThingPosWithDebug(cid)
    local pL = {x = p.x + 5, y = p.y + 1, z = p.z}
    local pO = {x = p.x - 3, y = p.y + 1, z = p.z}
    local pN = {x = p.x + 1, y = p.y + 5, z = p.z}
    local pS = {x = p.x + 1, y = p.y - 3, z = p.z}

    local po = {pL, pO, pN, pS}
    local po2 = {
        {x = pL.x, y = pL.y - 1, z = pL.z},
        {x = pO.x, y = pO.y - 1, z = pO.z},
        {x = pN.x - 1, y = pN.y, z = pN.z},
        {x = pS.x - 1, y = pS.y, z = pS.z}
    }

    -- Define condição de Stun
    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 34,
        spell = spell,
        cond = "Stun"
    }

    -- Aplica efeitos visuais e dano em 4 direções
    for i = 1, 4 do
        doSendMagicEffect(po[i], 127)
        doAreaCombatHealth(cid, GROUNDDAMAGE, po2[i], crusher, -min, -max, 255)
    end

    -- Dano em área central com condição
    doMoveInArea2(cid, 118, stomp, GROUNDDAMAGE, min, max, spell, ret)

    return true
end