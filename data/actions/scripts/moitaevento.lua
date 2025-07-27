function onUse(cid, item, fromPosition, itemEx, toPosition)
local pokemons = {"charmander", "baby pikachu", "squirtle"}
local randomIndex = math.random(#pokemons)
local selectedPokemon = pokemons[randomIndex]

    if item.itemid == 10743 and item.actionid == 16661 then
        doRemoveItem(item.uid) -- Remove a moita clicada
        
        -- Obtém a posição da moita removida
        local bushPosition = toPosition
        
        -- Spawna o Pokémon para ser derrotado exatamente na posição da moita removida
        doCreateMonster(selectedPokemon, bushPosition)
    end
    return true
end