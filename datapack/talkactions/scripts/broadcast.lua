function onSay(cid, words, param, channel)
	if(param == '') then
		return true
	end

--	doPlayerBroadcastMessage(cid, param)

        doSendPlayerExtendedOpcode(cid, 90, param)
	return true
end
