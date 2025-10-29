OPCODE_LANGUAGE = 1

function spliting(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = string.find(str, fpat, 1)

   while s do
      if s ~= 1 or cap ~= "" then
        table.insert(t,cap)
      end

      last_end = e+1
      s, e, cap = string.find(str, fpat, last_end)
   end

   if last_end <= #str then
      cap = string.sub(str, last_end)
      table.insert(t, cap)
   end

   return t
end

function onExtendedOpcode(cid, opcode, buffer)
        if opcode == OPCODE_LANGUAGE then
         -- otclient language
         if buffer == 'en' or buffer == 'pt' then
                 -- example, setting player language, because otclient is multi-language...
                 --doCreatureSetStorage(cid, CREATURE_STORAGE_LANGUAGE, buffer)
         end
	elseif opcode == 44 then
    if string.find(buffer, "revive=") then
	  local tab = spliting(buffer, "revive=")
	  -- alguma verificação de poke
	  -- print(tab[1])
	  doRevivePokemon(cid, tab[1])
	end
	elseif opcode == al_config.opcode then
    if string.find(buffer, "/items/") then
      sendItemsAL(cid, spliting(buffer, "/items/")[1])
    elseif string.find(buffer, "/item/") then
      local t = spliting(buffer, "/item/")
      local itemid = t[1]
      local type = t[2]
      doChangeItemInAL(cid, type, itemid)
    elseif string.find(buffer, "/state/") then
      if getPlayerStorageValue(cid, al_config.str) > 0 then
        setPlayerStorageValue(cid, al_config.str, 0)
      else
        setPlayerStorageValue(cid, al_config.str, 1)
      end
      sendItemsAL(cid, spliting(buffer, "/state/")[1])
    end
end
 return true
end