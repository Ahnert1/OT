local x = 1
function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, x)
		x = x + 1
		return true
	end
	return true
end
