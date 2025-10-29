function onUse(cid, item, fromPosition, itemEx, toPosition)
 
 if getPlayerStorageValue(cid, 17001) > 0 or getPlayerStorageValue(cid, 17000) > 0 or getPlayerStorageValue(cid, 63215) > 0 then
	if getPlayerLanguage(cid) == 0 then
		doPlayerSendCancel(cid, "Você não pode colocar addon em situações especiais.")
	end
	if getPlayerLanguage(cid) == 2 then
		doPlayerSendCancel(cid, "You can not add addon in special situations.")
	end
	if getPlayerLanguage(cid) == 1 then
		doPlayerSendCancel(cid, "No se puede colocar addon en situaciones especiales.")
	end
    return true
end
 
 
 
 
 
if #getCreatureSummons(cid) > 0 then
	if getPlayerLanguage(cid) == 0 then
		addEvent(doPlayerSendCancel,1,cid, "Chame seu pokemon para a pokeball.")
	end
	if getPlayerLanguage(cid) == 1 then
		addEvent(doPlayerSendCancel,1,cid ,"Llame su pokemon a la pokebola.")
	end	
	if getPlayerLanguage(cid) == 2 then
		addEvent(doPlayerSendCancel,1,cid, "Call your pokemon for pokeball.")
	end
	return true
end     

local pb = getPlayerSlotItem(cid, 8).uid
local pokename = getItemAttribute(pb, "poke") or 0
local limit = getItemAttribute(itemEx.uid, "limitaddons") or 0
local poke = getItemAttribute(itemEx.uid, "poke") or 0
local toaddon = 0
local addon = 0
local addonlook = 0
local pokesUses = ""

for key,value in next,addons[item.itemid],nil do
	if key == pokename then
		toaddon = key
	end
	if key ~= "nome" then
		if pokesUses ~= "" then
		pokesUses = key.." , "..pokesUses
		else
		pokesUses = key
		end
	end

end


 if limit == limitaddon then
	if getPlayerLanguage(cid) == 0 then
		addEvent(doPlayerSendCancel,1,cid, "Seu pokémon atingiu o limite maximo de addons.")
	end
	if getPlayerLanguage(cid) == 1 then
		addEvent(doPlayerSendCancel,1,cid,"Su pokemon alcanzó el límite máximo de addons.")
	end
	if getPlayerLanguage(cid) == 2 then
		addEvent(doPlayerSendCancel,1,cid,"Your pokemon has reached the maximum limit of addons.")
	end
	return true
end



	if pokename ~= 0 and toaddon == 0 then
		if getPlayerLanguage(cid) == 0 then
			doPlayerSendCancel(cid, "Desculpa, você não pode usar esse addon no "..poke..".Usado em ("..pokesUses..")")
		end

		if getPlayerLanguage(cid) == 1 then
			doPlayerSendCancel(cid ,"Lo sentimos, no se puede utilizar este addon en esse "..poke..".")
		end
			
		if getPlayerLanguage(cid) == 2 then
			doPlayerSendCancel(cid, "Sorry, you can't use this addon on this "..poke..".")
		end
	return true
	elseif(poke == 0) then
		if getPlayerLanguage(cid) == 0 then
			doPlayerSendCancel(cid, "Você deve usar em um pokémon!.")
		end

		if getPlayerLanguage(cid) == 1 then
		doPlayerSendCancel(cid ,"Usted debe utilizar en un pokemon!.")
		end
			
		if getPlayerLanguage(cid) == 2 then
			doPlayerSendCancel(cid, "You should use it on a pokemon!.")
		end
	return true
	end

	if pb ~= itemEx.uid then
	if getPlayerLanguage(cid) == 0 then
			doPlayerSendCancel(cid, "Coloque o pokemon no lugar certo.")
		end

		if getPlayerLanguage(cid) == 1 then
			doPlayerSendCancel(cid ,"Ponga el pokemon en el lugar correcto.")
		end
			
		if getPlayerLanguage(cid) == 2 then
			doPlayerSendCancel(cid, "Put the pokemon in the right place.")
		end
	return true
end

addonlook = addons[item.itemid].nome
addon = addons[item.itemid][pokename].looktype


	if getItemAttribute(itemEx.uid, "pokeballusada") == 0 then
		for i = 1, limitaddon do
			local atrib = "addon"..i
			local atrib1 = "addonlook"..i
			local check = getItemAttribute(itemEx.uid, atrib) or 0
			local limits = getItemAttribute(itemEx.uid, "limitaddons") or 0
			
			if check == addon then
				return true,addEvent(doPlayerSendCancel,1,cid,"Seu pokémon já tem esse addon.")
			end
			
			if check == 0 then
				doSetItemAttribute(itemEx.uid,atrib,addon)
				doSetItemAttribute(itemEx.uid,atrib1,addonlook)
				
				doSetItemAttribute(itemEx.uid,"limitaddons",limits+1)
				doSetItemAttribute(itemEx.uid,"addon",addon)
				doSetItemAttribute(itemEx.uid,"addonlook",addonlook)
				
				doRemoveItem(item.uid, 1)
				doSendMagicEffect(fromPosition, 180)
				break;
			end
		end
	else
		if getPlayerLanguage(cid) == 0 then
			doPlayerSendCancel(cid, "Você tem que usar o pokemon ao menos uma vez.")
		end

		if getPlayerLanguage(cid) == 1 then
			doPlayerSendCancel(cid ,"Usted tiene que usar pokemon al menos una vez.")
		end
			
		if getPlayerLanguage(cid) == 2 then
			doPlayerSendCancel(cid, "You have to use the pokemon at least once.")
		end
		return true
	end
	return true
end