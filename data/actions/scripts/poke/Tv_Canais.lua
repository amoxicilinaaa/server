
function onUse(cid, item, topos, item2, frompos)
    if playerHasTv(cid) then
        doPlayerSendCancel(cid, "Voc� n�o pode assistindo enquanto grava.")
        return false
    end
    doSendChannelsTv(cid)
	return true
end