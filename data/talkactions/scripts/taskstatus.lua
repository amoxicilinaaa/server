local config = {
    -- EASY
    ["Erick"] = 431300,
    ["Rolland"] = 431301,
    ["Pedro Pescador"] = 431302,
    ["Luciane"] = 431303,
    ["Marco"] = 431304,
    ["Ronaldinho"] = 431305,
    ["Flavia"] = 9659452,
    ["Alex"] = 431401,
    ["John"] = 431402,
    ["Peter"] = 431403,
    ["Jeffrey"] = 431404,
    ["Gary"] = 431405,
    ["Franklin"] = 431406,
    ["Niel"] = 431407,
    ["Joana"] = 431408,
    ["Bruna"] = 431409,
    ["Mary"] = 431500,
    ["Escobar"] = 431411,
    ["Vitoria"] = 431412,
    ["Rebecca"] = 431413,
    ["Christian"] = 431414,
    ["Christine"] = 431415,
    ["Jeff"] = 431416,
    ["Javier"] = 431417,
    ["Deborah"] = 431418,
    ["Sarah"] = 431419,
    ["Quinn"] = 431420,
    ["Ronald"] = 431421,
    ["Sylvester"] = 431422,
    ["Kathleen"] = 431423,
    ["Betty"] = 431424,

    -- MEDIUM
    ["Nancy"] = 431425,
    ["Dorothy"] = 431426,
    ["Timothy"] = 431427,
    ["Carlos"] = 431428,
    ["Crystal"] = 431429,
    ["Margaret"] = 431430,
    ["Judith"] = 431431,
    ["Samuel"] = 431432,
    ["Susan"] = 431433,
    ["Stephanie"] = 431434,
    ["Petra"] = 431435,
    ["Gregory"] = 431436,
    ["Reid"] = 431437,
    ["Rachel"] = 431438,
    ["Shirley"] = 431439,
    ["Robert"] = 431440,
    ["Sandra"] = 431441,
    ["Stephen"] = 431442,
    ["Ethel"] = 431443,
    ["Oliver"] = 431444,
    ["Carolina"] = 431445,
    ["Charlene"] = 431446,
    ["Peggy"] = 431447,
    ["Cora"] = 431448,
    ["Pat"] = 431449,

    -- HARD
    ["Michael"] = 431450,
    ["Amanda"] = 431451,
    ["Raymond"] = 431452,
    ["Jessica"] = 431453,
    ["Loren"] = 431454,
    ["Deloris"] = 431455,
    ["Charles"] = 431456,
    ["Dolores"] = 431457,
    ["Clinton"] = 431458,
    ["Lena"] = 431459,
    ["Todd"] = 431460,
    ["Heather"] = 431461,
    ["Eduardo"] = 431462,
    ["Socorro"] = 431463,
    ["Booker"] = 431464,
    ["Melissa"] = 431465,
    ["Columbus"] = 431466,
    ["Catherine"] = 431467,
    ["Peter"] = 431468,
    ["Silvia"] = 431469,
    ["Ronnie"] = 431470,
    ["Jennifer"] = 431471,
    ["Enrique"] = 431472,
    ["Jan"] = 431473,
    ["Philip"] = 431474,

    -- EXPERT
    ["Heidi"] = 431475,
    ["Hollis"] = 431476,
    ["Eva"] = 431477,
    ["Bradley"] = 431478,
    ["Samantha"] = 431479,
    ["James"] = 431480,
    ["Kelly"] = 431481,
    ["Daniel"] = 431482,
    ["Michelle"] = 431483,
    ["Lynn"] = 431484,
    ["Janey"] = 431485,
    ["Micheal"] = 431486,
    ["Leona"] = 431487,
    ["Christopher"] = 431488,
    ["Diane"] = 431489,
    ["Dennis"] = 431490,
    ["Patricia"] = 431491,
    ["Milton"] = 431492,
    ["Jeanette"] = 431493,
    ["Justin"] = 431494,
    ["Lavon"] = 431495,
    ["Homer"] = 431496,
    ["Ann"] = 431497,
    ["Jason"] = 431498,
    ["Olga"] = 431499,
}

function onSay(cid, words, param)
    -- Categorias em ORDEM FIXA (Easy -> Expert)
    local categoryOrder = {"Easy", "Medium", "Hard", "Expert"}
    local categories = {
        ["Easy"]   = {min = 431300, max = 431424, tasks = {}, completed = 0},
        ["Medium"] = {min = 431425, max = 431449, tasks = {}, completed = 0},
        ["Hard"]   = {min = 431450, max = 431474, tasks = {}, completed = 0},
        ["Expert"] = {min = 431475, max = 431499, tasks = {}, completed = 0}
    }

    -- Organiza tasks por categoria (mesmo código anterior)
    for npcName, storageId in pairs(config) do
        for catName, catData in pairs(categories) do
            if storageId >= catData.min and storageId <= catData.max then
                local isComplete = getPlayerStorageValue(cid, storageId) == 1
                table.insert(catData.tasks, {name = npcName, complete = isComplete})
                if isComplete then
                    catData.completed = catData.completed + 1
                end
                break
            end
        end
    end

    -- Construindo a mensagem NA ORDEM DESEJADA
    local result = "===== TASKS STATUS =====\n\n"
    local totalCompleted, totalTasks = 0, 0

    -- Itera na ordem: Easy -> Medium -> Hard -> Expert
    for _, catName in ipairs(categoryOrder) do
        local catData = categories[catName]
        result = result .. string.upper(catName) .. " (" .. catData.completed .. "/" .. #catData.tasks .. ")\n"
        for _, task in ipairs(catData.tasks) do
            result = result .. (task.complete and "[OK] " or "[ ] ") .. task.name .. "\n"
        end
        result = result .. "\n"
        totalCompleted = totalCompleted + catData.completed
        totalTasks = totalTasks + #catData.tasks
    end

    -- Resto do código (total e progresso)
    result = result .. "=======================\n"
    result = result .. "TOTAL: " .. totalCompleted .. "/" .. totalTasks .. " tasks\n"
    result = result .. "Progresso: " .. math.floor((totalCompleted / totalTasks) * 100) .. "%"

    doShowTextDialog(cid, 7528, result)
    return true
end