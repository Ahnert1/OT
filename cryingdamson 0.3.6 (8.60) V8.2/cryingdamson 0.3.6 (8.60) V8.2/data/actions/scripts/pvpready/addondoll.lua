function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, 1800) == -1 then
            doCreatureSay(cid, "You received the first addons!", TALKTYPE_ORANGE_1)
            doPlayerAddAddons(cid, 1)
            doSendMagicEffect(fromPosition, 66)
            doRemoveItem(item.uid)
            setPlayerStorageValue(cid,1800, 0)
			doRemoveItem(item.uid, 1)
		return true
		end
		if getPlayerStorageValue(cid, 1800) == 0 then
            doCreatureSay(cid, "You received the second addons!", TALKTYPE_ORANGE_1)
            doPlayerAddAddons(cid, 2)
            doSendMagicEffect(fromPosition, 66)
            doRemoveItem(item.uid)
            setPlayerStorageValue(cid,1800,1)
			doRemoveItem(item.uid, 1)
		return true
		end	
		if getPlayerStorageValue(cid, 1800) == 1 then
            doCreatureSay(cid, "You already have all the addons.", TALKTYPE_ORANGE_1)
            doSendMagicEffect(fromPosition, 2)
		return true
        end 
end