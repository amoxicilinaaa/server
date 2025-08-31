function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Ativa storage para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)

    -- Função que encerra o estado
    local function setSto(cid)
        if isCreature(cid) then
            setPlayerStorageValue(cid, 3644587, -1)
        end
    end

    -- Função que aplica dano periódico
    local function doDano(cid)
        if isSleeping(cid) then return true end
        doDanoWithProtect(cid, WATERDAMAGE, getThingPosWithDebug(cid), splash, min, max, 89)
    end

    -- Executa 10 pulsos de dano com intervalo de 600ms
    for r = 0, 10 do
        addEvent(doDano, r * 600, cid)
    end

    -- Encerra o estado após o último pulso
    addEvent(setSto, 600 * 10, cid)

    return true
end
