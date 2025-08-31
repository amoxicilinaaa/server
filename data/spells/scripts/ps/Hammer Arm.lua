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

    -- Parâmetros da condição "Stun"
    local ret = {
        id = 0,
        cd = 6,
        eff = 88,
        check = getPlayerStorageValue(target, conds["Stun"]),
        spell = spell,
        cond = "Stun"
    }

    -- Determina a direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Posição base do caster
    local p = getThingPosWithDebug(cid)

    -- Tabela de efeitos visuais por direção
    local t = {
        [0] = {92, {x = p.x, y = p.y, z = p.z}},           -- Norte
        [1] = {94, {x = p.x + 2, y = p.y, z = p.z}},        -- Leste
        [2] = {95, {x = p.x + 1, y = p.y + 2, z = p.z}},    -- Sul
        [3] = {93, {x = p.x, y = p.y, z = p.z}}             -- Oeste
    }

    -- Aplica dano tipo FIGHTING na área "HammerArm" com condição "Stun"
    doMoveInArea2(cid, 0, HammerArm, FIGHTINGDAMAGE, min, max, spell, ret)

    -- Efeito visual baseado na direção
    doSendMagicEffect(t[a][2], t[a][1])

    return true
end