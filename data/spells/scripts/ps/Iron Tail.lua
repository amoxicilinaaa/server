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

    -- Função que restaura a velocidade original após delay
    local function rebackSpd(cid, sss)
        if not isCreature(cid) then return true end
        doChangeSpeed(cid, sss)
        setPlayerStorageValue(cid, 446, -1)
    end

    -- Reduz temporariamente a velocidade do caster
    local x = getCreatureSpeed(cid)
    doFaceOpposite(cid)
    doChangeSpeed(cid, -x)
    addEvent(rebackSpd, 400, cid, x)
    setPlayerStorageValue(cid, 446, 1)

    -- Aplica dano tipo STEEL com efeito visual 160
    doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 160)

    return true
end