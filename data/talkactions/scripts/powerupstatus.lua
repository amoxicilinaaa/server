function onSay(cid, words, param)
    local contagem_total = 14750
    local bonuss_max = 31

    local tiles = {
        [1803] = "Entrada da Caverna",
        [1804] = "Vale dos Pikachus",
        [1805] = "Ru�nas Antigas",
        [1806] = "Lago Misterioso",
        [1807] = "Campo El�trico",
        [1808] = "Floresta Sombria",
        [1809] = "Templo do Fogo",
        [1810] = "Caminho do Vento",
        [1811] = "Caverna Gelo",
        [1812] = "Arena Selvagem",
        [1813] = "Laborat�rio Abandonado",
        [1814] = "Pedra da Evolu��o",
        [1815] = "Caminho Subterr�neo",
        [1816] = "Montanha do Raio",
        [1817] = "Vale dos Fantasmas",
        [1818] = "Ru�nas de Johto",
        [1819] = "Caminho do Drag�o",
        [1820] = "Hunt Charizard",
        [1821] = "Caverna Cristalina",
        [1822] = "Templo Ps�quico",
        [1823] = "Arena Aqu�tica",
        [1824] = "Caminho do Despertar",
        [1825] = "Vale dos Eevees",
        [1826] = "Caminho do Mestre",
        [1827] = "Caverna do Tempo",
        [1828] = "Templo do C�u",
        [1829] = "Ru�nas de Kanto",
        [1830] = "Arena Final",
        [1831] = "Caminho da Luz",
        [1832] = "Caminho da Escurid�o",
        [1833] = "Portal Final"
    }

    local total = getPlayerStorageValue(cid, contagem_total)
    if total == -1 then total = 0 end

    local texto = "PowerUps coletados: "..total.."/"..bonuss_max.."\n\n"

    local coletados = "[*] J� coletados:\n"
    local faltando = "[ ] Ainda faltam:\n"

    for aid = 1803, 1833 do
        local nome = tiles[aid] or "Piso sem nome"
        local status = getPlayerStorageValue(cid, aid)
        local linha = (status >= 1 and "[*] - " or "[ ] - ") .. nome .. "\n"
        if status >= 1 then
            coletados = coletados .. linha
        else
            faltando = faltando .. linha
        end
    end

    texto = texto .. coletados .. "\n" .. faltando
    doShowTextDialog(cid, 1950, texto)
    return true
end
