dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    -- Função local para disparar uma bomba de veneno
    local function doAcidBomb(cid, areaDMG, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 107)
        doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 614, areaDMG)
        return true
    end

    -- Áreas de dano sequenciais
    local areas = {poisonBomb1, poisonBomb2, poisonBomb3}
    for i = 0, 2 do
        addEvent(doAcidBomb, 200 * i, cid, areas[i + 1], target)
    end
    return true
end