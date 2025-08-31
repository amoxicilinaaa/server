function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    if isCreature(target) then
        -- Define condição: "Miss" para Mud Shot, "Stun" para demais
        local contudion = (spell == "Mud Shot") and "Miss" or "Stun"

        local ret = {
            id = target,
            cd = 9,
            eff = (spell == "Mud Shot") and 1041 or 34,
            check = getPlayerStorageValue(target, conds[contudion]),
            spell = spell,
            cond = contudion
        }

        -- Projétil visual e aplicação da condição com delay
        local shootEffect = (spell == "Mud Shot") and 138 or 6
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), shootEffect)
        addEvent(doMoveDano2, 100, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)
    end

    return true
end