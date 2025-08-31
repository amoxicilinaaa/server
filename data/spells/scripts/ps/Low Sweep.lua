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

    -- Parâmetros da condição "Confusion"
    local ret = {
        id = 0,
        cd = 9,
        eff = 88,
        check = 0,
        spell = spell,
        cond = "Confusion"
    }

    -- Determina direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Define efeitos visuais por direção e espécie
    local t
    if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then
        t = {
            [0] = {643, {x = p.x + 1, y = p.y, z = p.z}},
            [1] = {644, {x = p.x + 2, y = p.y + 1, z = p.z}},
            [2] = {645, {x = p.x + 1, y = p.y + 2, z = p.z}},
            [3] = {646, {x = p.x, y = p.y, z = p.z}},
        }
    else
        t = {
            [0] = {653, {x = p.x + 1, y = p.y, z = p.z}},
            [1] = {654, {x = p.x + 2, y = p.y + 1, z = p.z}},
            [2] = {655, {x = p.x + 1, y = p.y + 2, z = p.z}},
            [3] = {656, {x = p.x, y = p.y, z = p.z}},
        }
    end

    -- Aplica dano tipo FIGHTING com condição Confusion
    doMoveInArea2(cid, 0, HammerArm, FIGHTINGDAMAGE, min, max, spell, ret)

    -- Efeito visual baseado na direção
    doSendMagicEffect(t[a][2], t[a][1])

    return true
end