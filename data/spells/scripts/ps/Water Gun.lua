function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Tabela de efeitos visuais por direção
    local t = {
        [0] = {69, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- norte
        [1] = {70, {x = p.x + 4, y = p.y,     z = p.z}}, -- leste
        [2] = {71, {x = p.x + 1, y = p.y + 4, z = p.z}}, -- sul
        [3] = {72, {x = p.x - 1, y = p.y,     z = p.z}}, -- oeste
    }

    local area = reto4

    -- Aplica dano em área
    doMoveInArea2(cid, 0, area, WATERDAMAGE, min, max, spell)

    -- Efeito visual conforme direção
    doSendMagicEffect(t[a][2], t[a][1])

    return true
end
