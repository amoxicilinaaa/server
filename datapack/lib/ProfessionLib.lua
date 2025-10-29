-- Sistema de profissão
-- Desenvolvido por Gabriel Lucena (Drazyn1291/BielLucena1291) e GOD Vitor.

-- Geral

ProfessionLib = {
	geral_sto = 123123, -- Não mecha
	OutfitTime = 8, -- Tempo em que dura a outfit
	NeedVip = true, -- Se precisa de vip para mudar/virar a profissão
	CostToChange = 125, -- Quantidade do itemid abaixo que vai ser usado para mudar de profissão
	itemid = 2160, -- Item que vai ser usado para mudar de profissão
	quantMax = 3, -- Quantidade máxima
}

ProfessionId = {
	--[4] = {name = Proffision Name, looktypeM = LookType male (Coletando item), looktypeF = LookType Female, CollectItemId = Item que coleta (Ex: Machado do stylist), CollectItem = Item Que é coletado (Madeira do stylist), targetItem = {target = Item Alvo (Arvore do Stylist), newid = Item que é transformado depois de cortado}},
	[1] = {name = "Stylist", looktypeM = 2466, looktypeF = 2467, CollectItemId = 2553, CollectItem = 5901, targetItem = {target = 2711, newid = 8786}},
	[2] = {name = "Engineer", looktypeM = 2464, looktypeF = 2465, CollectItemId = 13327, CollectItem = 8309, targetItem = {target = 1480, newid = 7660}},
	[3] = {name = "Adventurer", looktypeM = 2480, looktypeF = 2481, CollectItemId = 11454, CollectItem = 13075, targetItem = {target = 2706, newid = 2741}},
	[4] = {name = "Teacher", looktypeM = 2476, looktypeF = 2477, CollectItemId = 11454, CollectItem = 13075, targetItem = {target = 2706, newid = 2741}},
}

-- NPC de troca

SellStylist = { 
	--{id = ID, toDo = {{id, quant}, {id, quant}}}
	[1] = {id = 7866, quant = 1, level = 50, toDo = {{2666, 45}, {5901, 475}}},
	[2] = {id = 7868, quant = 1, level = 80, toDo = {{12148, 15}, {5901, 580}}},
}

SellEnginner = {
	--{id = ID, toDo = {{id, quant}, {id, quant}}}
	[1] = {id = 2174, quant = 100, level = 10, toDo = {{2177, 10}, {2160, 2}}},
	[2] = {id = 2175, quant = 10, level = 10, toDo = {{2179, 2}, {2160, 3}}},
}

SellAdventurer = {
	--{id = ID, toDo = {{id, quant}, {id, quant}}}
	[1] = {id = 2174, quant = 100, level = 10, toDo = {{2177, 10}, {2160, 2}}},
	[2] = {id = 2175, quant = 10, level = 10, toDo = {{2179, 2}, {2160, 3}}},
}

SellTeacher = {
	--{id = ID, toDo = {{id, quant}, {id, quant}}}
	[1] = {id = 2174, quant = 100, level = 10, toDo = {{2177, 10}, {2160, 2}}},
	[2] = {id = 2175, quant = 10, level = 10, toDo = {{2179, 2}, {2160, 3}}},
}

-- Functions

function canEnterInProfession(cid)
	if ProfessionLib.NeedVip and not isPremium(cid) then
		return false
	end
	return true
end

function existProfession(profName)
	cont = false
	for i = 1, #ProfessionId do
		if not cont then
			if ProfessionId[i].name == profName then
				cont = true
			end
		end
	end
	return cont
end

function hasProfession(cid)
	if ProfessionId[getPlayerProfessionId(cid)] then
		return true
	end
	return false
end

function existProfession(profName)
	cont = false
	for i = 1, #ProfessionId do
		if not cont then
			if ProfessionId[i].name == profName then
				cont = true
			end
		end
	end
	return cont
end

function getProfessionIdByName(profName)
	for i = 1, #ProfessionId do
		if ProfessionId[i].name == profName then
			return i
		end
	end	
end

function doChangeProfession(cid, id, check)
	if ProfessionLib.NeedVip and not isPremium(cid) then
		return false
	end

	if check then
		if hasProfession(cid) then
			return false
		else
			if ProfessionId[id] or id == 0 then
				setPlayerStorageValue(cid, ProfessionLib.geral_sto, id)
				doPlayerAddItem(cid, ProfessionId[id].CollectItemId, 1)
			else
				return false
			end
		end
	else
		if ProfessionId[id] or id == 0 then
			setPlayerStorageValue(cid, ProfessionLib.geral_sto, id)
			doPlayerAddItem(cid, ProfessionId[id].CollectItemId, 1)
		else
			return false
		end		
	end
end

function getPlayerProfessionId(cid)
	return getPlayerStorageValue(cid, ProfessionLib.geral_sto)
end

function getProfessionName(cid)
	if hasProfession(cid) then
		return ProfessionId[getPlayerProfessionId(cid)].name
	end
	return ""
end

function doReturnItemsWithDelay(toPosition, itemid, times)
	local function doReturnItem(itemposition,oldid)
		local pos = getThingfromPos(itemposition)
		doTransformItem(pos.uid,oldid)
		doSetItemText(pos.uid, getItemNameById(oldid))	
	end
	addEvent(doReturnItem, times * 1000,toPosition, itemid)
end

function doConcatTable(itemsss, sep1, sep2)
	str = ""
	if #itemsss > 0 then
		for i = 1, #itemsss do
			if #itemsss > 1 then
				if i ~= #itemsss then
					if i ~= 1 then
						str = str..sep1..itemsss[i]
					else
						str = str..itemsss[i]
					end
				else
					str = str..sep2..itemsss[i]
				end
			else
				str = itemsss[i]
			end
		end
	end
	return str
end