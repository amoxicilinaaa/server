function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local pid = spellData.target

    local p = getThingPos(cid)
    local pa = {x = p.x + 1, y = p.y, z = p.z}

    -- Define tipo de dano e efeito visual por espécie
    local atk = isInArray({
        "Camerupt", "Typhlosion", "Magmar", "Magmortar",
        "Shiny Camerupt", "Shiny Typhlosion", "Shiny Magmar",
        "Shiny Magmortar", "Mega Camerupt"
    }, getCreatureName(cid)) and {
        ["Lava Plume"] = {98, 712, FIREDAMAGE},
        ["Rash Scald"] = {98, 715, WATERDAMAGE}
    } or {
        ["Lava Plume"] = {98, 713, FIREDAMAGE},
        ["Rash Scald"] = {98, 715, WATERDAMAGE}
    }

    -- Define efeito de fumaça/vapor
    local fumaaCaa = spell == "Rash Scald" and 854 or 255

    -- Função auxiliar para aplicar dano com efeito
    local function sendDano(cid, pos, eff, delay, min, max)
        if pos and isCreature(cid) then
            addEvent(doDanoWithProtect, delay, cid, atk[spell][3], pos, 0, -min, -max, eff)
        end
    end

    -- Função principal que executa o tornado em espiral
    local function doTornado(cid)
        if not isCreature(cid) then return end

        for j = 1, 2 do
            for i = 1, 6 do
                local delay1 = i * 280
                local delay2 = i * 290

                -- Frente
                sendDano(cid, pos1[j][i], atk[spell][2], delay1, min, max)
                sendDano(cid, pos1[j][i], atk[spell][2], delay2, 0, 0)

                -- Trás
                sendDano(cid, pos2[j][i], atk[spell][2], delay1, min, max)
                sendDano(cid, pos2[j][i], atk[spell][2], delay2, 0, 0)

                -- Direita
                sendDano(cid, pos3[j][i], atk[spell][2], delay1, min, max)
                sendDano(cid, pos3[j][i], atk[spell][2], delay2, 0, 0)

                -- Esquerda
                sendDano(cid, pos4[j][i], atk[spell][2], delay1, min, max)

                -- Fumaça/Vapor nas variantes
                sendDano(cid, pos1a[j][i], fumaaCaa, delay1, 0, 0)
                sendDano(cid, pos2a[j][i], fumaaCaa, delay1, 0, 0)
                sendDano(cid, pos3a[j][i], fumaaCaa, delay1, 0, 0)
            end
        end
    end

    -- Executa o tornado em 3 ondas com delay
    for b = 0, 2 do
        addEvent(doTornado, b * 1250, cid)
        doSendMagicEffect(getThingPosWithDebug(pid), 854)
    end

    return true
end