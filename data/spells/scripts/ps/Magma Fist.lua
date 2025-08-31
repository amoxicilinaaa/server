function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Determina direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Efeitos visuais por direção
    local t = {
        [0] = {561, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- norte
        [1] = {559, {x = p.x + 3, y = p.y + 1, z = p.z}}, -- leste
        [2] = {558, {x = p.x + 1, y = p.y + 4, z = p.z}}, -- sul
        [3] = {560, {x = p.x - 1, y = p.y + 1, z = p.z}}, -- oeste
    }

    -- Aplica dano tipo FIRE na área triplo4
    doMoveInArea2(cid, 0, triplo4, FIREDAMAGE, min, max, spell)

    -- Efeito visual direcional
    doSendMagicEffect(t[a][2], t[a][1])

    -- Aplica burn no alvo
    doBurnPoke(cid, target)

    return true
end