-- Sistema de profissão
-- Desenvolvido por Gabriel Lucena (Drazyn1291/BielLucena1291)

--Tag: <action itemid="ITEMID;ITEMID;ITEMID;ITEMID" event="script" value="ProfessionAction.lua"/>-

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not isCreature(itemEx.uid) then
		if not (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1) then
			if ProfessionId[getPlayerProfessionId(cid)] then
				cont = false
				name = ""
				for i = 1, #ProfessionId do
					if item.itemid == ProfessionId[i].CollectItemId and i == getPlayerProfessionId(cid) then
						cont = true
					else
						if item.itemid == ProfessionId[i].CollectItemId then
							name = ProfessionId[i].name
						end
					end
				end
				if cont then
					if ProfessionId[getPlayerProfessionId(cid)].targetItem.target == itemEx.itemid then
						toPos = getThingPosition(itemEx.uid)
						fromPos = getCreaturePosition(cid)
						if getDistanceBetween(fromPos, toPos) <= 1 then
							if getDirectionTo(fromPos, toPos) == getCreatureLookDirection(cid) then
								quantItem = math.random(1, ProfessionLib.quantMax)
								doCreatureSetNoMove(cid, true)
								if getPlayerSex(cid) == 1 then
									lp = ProfessionId[getPlayerProfessionId(cid)].looktypeM
								else
									lp = ProfessionId[getPlayerProfessionId(cid)].looktypeF
								end
								doSetCreatureOutfit(cid, {lookType = lp}, -1) -- getCreatureLookDirection(cid)
								addEvent(function()
									doRemoveCondition(cid, CONDITION_OUTFIT)
									doCreatureSetNoMove(cid, false)
									doTransformItem(getThingFromPos(toPos).uid, ProfessionId[getPlayerProfessionId(cid)].targetItem.newid)
									doReturnItemsWithDelay(toPos, ProfessionId[getPlayerProfessionId(cid)].targetItem.target, 15)
									doPlayerAddItem(cid, ProfessionId[getPlayerProfessionId(cid)].CollectItem, quantItem)
									doPlayerSendTextMessage(cid, 27, "Você recebeu "..quantItem.."x "..getItemNameById(ProfessionId[getPlayerProfessionId(cid)].CollectItem).." por fazer essa ação!")
								end, ProfessionLib.OutfitTime*1000)
							else
								doPlayerSendCancel(cid, "Você percisa ficar de frente para esse item!")
							end
						else
							doPlayerSendCancel(cid, "Você precisa está na frente do item!")
						end
					else
						doPlayerSendCancel(cid, "Você não pode usar esse item aqui!")
					end
				else
					doPlayerSendCancel(cid, "Você precisa ser "..name.." para usar esse item!")
				end
			else
				doPlayerSendCancel(cid, "Você não tem nenhuma profissão!")
			end
		else
			doPlayerSendCancel(cid, "Você não pode usar esse item enquanto estiver montado!")
		end
	else
		doPlayerSendCancel(cid, "Você não pode usar esse item aqui!")
	end
	return true
end