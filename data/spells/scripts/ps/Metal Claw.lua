function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posT1 = spellData.posT1

    -- Ajuste de posição visual
    posT1.y = posT1.y - 1

    local name = getSubName(cid, target)

    if isInArray({"Lucario", "Shiny Lucario", "Sneasel"}, name) then
        -- Espécies com efeito visual especial
        doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 394)

    elseif isInArray({"Aggron", "Scizor", "Zangoose"}, name) then
        -- Espécies que recebem dano duplo (com efeito visual 779)
        doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)
        addEvent(doDanoWithProtect, 150, cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)
        doSendMagicEffect(posT1, 779)

    else
        -- Direção do caster para definir efeito visual
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local efeito = (a == 1 or a == 2) and 780 or 781

        doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)
        doSendMagicEffect(posT1, efeito)
    end

    return true
end