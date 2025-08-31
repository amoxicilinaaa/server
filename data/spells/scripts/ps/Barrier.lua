dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local posC = spellData.posC
    local posT = spellData.posT

    -- Função para limpar storages após 8s
    local function sendAtk(cid)
        if not isCreature(cid) then return end
        setPlayerStorageValue(cid, 9658783, -1)
        setPlayerStorageValue(cid, 734276, -1)
    end

    -- Função para enviar efeito visual
    local function doSendEff(pos)
        return function()
            if isCreature(cid) then
                doSendMagicEffect({x = pos.x + 1, y = pos.y + 1, z = pos.z}, 172)
            end
        end
    end

    if not isCreature(getCreatureTarget(cid)) then
        -- Sem alvo: entra em estado especial
        setPlayerStorageValue(cid, 734276, 1)
        setPlayerStorageValue(cid, 9658783, 1)

        for i = 0, 7 do
            addEvent(doSendEff(posC), i * 1000)
        end

        addEvent(sendAtk, 8000, cid)
        stopNow(cid, 8 * 800)

    else
        -- Com alvo: aplica Sleep
        local ret = {
            id = target,
            cd = math.random(8, 9),
            check = getPlayerStorageValue(target, conds["Sleep"]),
            eff = 0,
            cond = "Sleep"
        }

        doSendDistanceShoot(posC, posT, 24)
        addEvent(function()
            if isCreature(cid) and isCreature(target) then
                doMoveDano2(cid, target, PSYCHICDAMAGE, 0, 0, ret, spell)
            end
        end, 150)

        for i = 0, 7 do
            addEvent(doSendEff(posT), i * 1000)
        end

        stopNow(target, 8 * 800)
    end

    return true
end