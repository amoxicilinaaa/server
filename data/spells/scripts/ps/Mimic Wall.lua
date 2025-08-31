function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local posC = spellData.posC
    local dirr = getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Define tipo de item visual conforme direção
    local item = (dirr == 0 or dirr == 2) and 11439 or 11440

    -- Posições de parede por direção
    local wall = {
        [0] = {
            {x = p.x, y = p.y - 1, z = p.z},
            {x = p.x + 1, y = p.y - 1, z = p.z},
            {x = p.x - 1, y = p.y - 1, z = p.z}
        },
        [2] = {
            {x = p.x, y = p.y + 1, z = p.z},
            {x = p.x + 1, y = p.y + 1, z = p.z},
            {x = p.x - 1, y = p.y + 1, z = p.z}
        },
        [1] = {
            {x = p.x + 1, y = p.y, z = p.z},
            {x = p.x + 1, y = p.y + 1, z = p.z},
            {x = p.x + 1, y = p.y - 1, z = p.z}
        },
        [3] = {
            {x = p.x - 1, y = p.y, z = p.z},
            {x = p.x - 1, y = p.y + 1, z = p.z},
            {x = p.x - 1, y = p.y - 1, z = p.z}
        }
    }

    -- Cria barreiras temporárias nas posições válidas
    if wall[dirr] then
        for i = 1, 3 do
            local tilePos = wall[dirr][i]
            if hasTile(tilePos) and canWalkOnPos2(tilePos, true, true, true, true, false) then
                local walls = doCreateItem(item, 1, tilePos)
                doDecayItem(walls)
            end
        end
    end

    return true
end