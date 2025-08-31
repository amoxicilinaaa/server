dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local pos = spellData.posC

    local t = {
        {{128, {x = pos.x + 1, y = pos.y - 1, z = pos.z}}, {16,  {x = pos.x + 1, y = pos.y - 1, z = pos.z}}},
        {{129, {x = pos.x + 2, y = pos.y + 1, z = pos.z}}, {221, {x = pos.x + 3, y = pos.y + 1, z = pos.z}}},
        {{131, {x = pos.x + 1, y = pos.y + 2, z = pos.z}}, {223, {x = pos.x + 1, y = pos.y + 3, z = pos.z}}},
        {{130, {x = pos.x - 1, y = pos.y + 1, z = pos.z}}, {243, {x = pos.x - 1, y = pos.y + 1, z = pos.z}}}
    }

    -- Efeitos visuais iniciais
    for i = 1, 4 do
        doSendMagicEffect(t[i][2][2], t[i][2][1])
    end

    -- Dano imediato na área airSlash
    doDanoWithProtect(cid, FLYINGDAMAGE, pos, airSlash, -min, -max, 0)

    -- Efeitos visuais atrasados
    for i = 1, 4 do
        addEvent(doSendMagicEffect, 400, t[i][1][2], t[i][1][1])
    end

    -- Dano atrasado na área bombWee2
    addEvent(function()
        if isCreature(cid) then
            doDanoWithProtect(cid, FLYINGDAMAGE, pos, bombWee2, -min, -max, 0)
        end
    end, 400)
    return true
end