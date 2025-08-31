function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Proteção contra uso repetido
    if getPlayerStorageValue(cid, 32623) == 1 then
        return true
    end

    -- Função que aplica dano em área
    local function damage(cid)
        if isCreature(cid) then
            doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPosWithDebug(cid), bombWee3, -min, -max, 133)
        end
    end

    -- Ativa proteção de uso
    setPlayerStorageValue(cid, 32623, 1)

    -- Executa 7 pulsos psíquicos com delay
    for i = 1, 7 do
        addEvent(damage, i * 500, cid)
    end

    -- Libera uso após 3.5 segundos
    addEvent(setPlayerStorageValue, 3500, cid, 32623, 0)

    -- Marca estado adicional (pode ser usado para sinergia com outras spells)
    setPlayerStorageValue(cid, 98654, 1)

    return true
end









