dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Define efeito visual do projétil
    local Shoot = 38 -- padrão

    if spell == "Vine Hook" then
        local subname = getSubName(cid, target)
        if subname == "Tangrowth" or subname == "Tangela" then
            Shoot = 38 -- pode ser alterado se quiser diferenciar
        else
            Shoot = 38 -- padrão verde do Vine Hook
        end
    end

    -- Disparo inicial
    sendDistanceShootWithProtect(cid, posC, posT, Shoot)

    -- Teleporte do alvo para perto do caster
    addEvent(doTeleportThing, 200, target, getClosestFreeTile(cid, posC), true)

    -- Disparo reverso simulando puxão
    addEvent(sendDistanceShootWithProtect, 200, cid, posT, posC, Shoot)

    return true
end