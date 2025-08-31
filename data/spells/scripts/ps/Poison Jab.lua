function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    local name = getSubName(cid, target)

    if isInArray({"Nidoking", "Shiny Nidoking", "Toxicroak", "Shiny Toxicroak"}, name) then
        -- Define direção do ataque
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)

        -- Efeitos visuais por direção
        local t = {
            [0] = {673, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- norte
            [1] = {670, {x = p.x + 2, y = p.y + 1, z = p.z}}, -- leste
            [2] = {671, {x = p.x + 1, y = p.y + 2, z = p.z}}, -- sul
            [3] = {672, {x = p.x,     y = p.y,     z = p.z}}, -- oeste
        }

        -- Dano em área com efeito visual
        doMoveInArea2(cid, 0, BrickBeak, POISONDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])

        -- Se quiser ativar efeito especial:
        -- doPoisonPoke(cid, target)

    else
        -- Fallback para outras espécies: projétil + dano direto
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
        doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 153)
    end

    return true
end