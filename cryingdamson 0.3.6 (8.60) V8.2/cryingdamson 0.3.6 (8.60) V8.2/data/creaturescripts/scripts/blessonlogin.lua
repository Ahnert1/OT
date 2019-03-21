function onLogin(cid)
 if getPlayerStorageValue(cid, 1337) > 0 then
    if isPlayer(cid) then
            doPlayerAddBlessing(cid, 1)
            doPlayerAddBlessing(cid, 2)
            doPlayerAddBlessing(cid, 3)
            doPlayerAddBlessing(cid, 4)
            doPlayerAddBlessing(cid, 5)
			doCreatureSay(cid, "Blessed! You wont lose items on death!", TALKTYPE_ORANGE_1)
		end
	else
	end
    return true
end