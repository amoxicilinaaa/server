function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    doCreatureSay(cid, "Up", TALKTYPE_MONSTER)

    -- Função que aplica efeitos visuais e dano com base na direção
    local function sendEffect(cid)
        if not isCreature(cid) or not isCreature(target) then return true end

        local pos   = getThingPos(target)
        local lado  = getCreatureLookDir(cid)

        local effes = {
            [0] = {effe1 = 261, effe2 = 265}, -- norte
            [1] = {effe1 = 263, effe2 = 266}, -- leste
            [2] = {effe1 = 262, effe2 = 264}, -- sul
            [3] = {effe1 = 260, effe2 = 267}  -- oeste
        }

        if lado == 0 then
            local pos2 = {x = pos.x, y = pos.y + 1, z = pos.z}
            doSendMagicEffect(pos2, effes[lado].effe1)
            pos.y = pos.y - 2
            pos.x = pos.x + 1

        elseif lado == 1 then
            doSendMagicEffect(pos, effes[lado].effe1)
            pos.y = pos.y + 2
            pos.x = pos.x + 2

        elseif lado == 2 then
            local pos2 = {x = pos.x + 1, y = pos.y, z = pos.z}
            doSendMagicEffect(pos2, effes[lado].effe1)
            pos.y = pos.y + 2
            pos.x = pos.x + 1

        elseif lado == 3 then
            local pos2 = {x = pos.x + 1, y = pos.y, z = pos.z}
            doSendMagicEffect(pos2, effes[lado].effe1)
            pos.y = pos.y + 2
            pos.x = pos.x - 2
        end

        -- Efeito secundário e dano com delay
        addEvent(doSendMagicEffect, 100, pos, effes[lado].effe2)
        addEvent(doDanoWithProtectWithDelay, 50, cid, target, SACREDDAMAGE, min, max, 255, sacred)
    end

    sendEffect(cid)

    return true
end
