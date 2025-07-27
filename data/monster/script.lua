local function processFile(filePath)
    local file = io.open(filePath, "r")
    if not file then
        return
    end

    local content = file:read("*all")
    file:close()

    -- Verifica e modifica a tag <count> para os IDs especificados
    local idsToCheck = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449, 11450, 11451, 11452, 11453, 11454, 12232, 12242, 12244, 12245, 12417, 19694}
    for _, id in ipairs(idsToCheck) do
        content = string.gsub(content, '<item id="' .. id .. '"(.-) count="10"(.-)/>', function(attributesStart, attributesEnd)
            return '<item id="' .. id .. '"' .. attributesStart .. ' count="1"' .. attributesEnd .. '/>'
        end)
    end

    -- Salva as alterações no arquivo
    file = io.open(filePath, "w")
    if file then
        file:write(content)
        file:close()
    end
end

local function processDirectory(directory)
    for file in io.popen('find "'..directory..'" -type f -name "*.xml" -print'):lines() do
        processFile(file)
    end
end

-- Diretório contendo os arquivos XML
local diretorio = "/home/server/data/monster/pokes/"

-- Processa os arquivos XML do diretório e subdiretórios
processDirectory(diretorio)
