dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local area = {Spikes01, Spikes02, Spikes03, Spikes04, Spikes05}

    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Paralisa o caster por 2 segundos
    stopNow(cid, 2000)

    -- Executa dano em sequência nas áreas de estacas
    for i = 1, 5 do
        addEvent(function()
            if isCreature(cid) then
                doMoveInArea2(cid, 412, area[i], GRASSDAMAGE, min, max, spell, ret)
            end
        end, i * 400)
    end

    return true
end