function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local target = spellData.target

    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Efeitos visuais por direção
    local t = {
        [0] = {509, {x = p.x,     y = p.y - 1, z = p.z}}, -- norte
        [1] = {510, {x = p.x + 5, y = p.y,     z = p.z}}, -- leste
        [2] = {512, {x = p.x,     y = p.y + 5, z = p.z}}, -- sul
        [3] = {511, {x = p.x - 1, y = p.y,     z = p.z}}, -- oeste
    }

    -- Aplica dano tipo FIRE na área definida
    local area = reto4
    doMoveInArea2(cid, 0, area, FIREDAMAGE, min, max, spell)

    -- Efeito visual na direção do ataque
    doSendMagicEffect(t[a][2], t[a][1])

    return true
end