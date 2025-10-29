OPCODE_LANGUAGE = 1
OPCODE_REVIVE = 44

function onExtendedOpcode(cid, opcode, buffer)
		--print("recebeu opcode: "..opcode.." buffer: "..buffer)
        if opcode == OPCODE_LANGUAGE then
         -- otclient language
         if buffer == 'en' or buffer == 'pt' then
                 -- example, setting player language, because otclient is multi-language...
                 --doCreatureSetStorage(cid, CREATURE_STORAGE_LANGUAGE, buffer)
         end
		elseif opcode == OPCODE_REVIVE then
			doRevivePokemon(cid, buffer)
        end
end