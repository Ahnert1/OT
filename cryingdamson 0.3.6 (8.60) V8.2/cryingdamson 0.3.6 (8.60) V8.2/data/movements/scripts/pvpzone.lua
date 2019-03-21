function onStepIn(cid, item, pos, frompos)
	if isPlayer(cid) == TRUE and item.actionid == 6969 and getPlayerStorageValue(cid,1337) == 1 then
		doTeleportThing(cid, {x=511, y=378, z=6})
		doPlayerSendTextMessage(cid,22,"You're now in the VIP area!")
	else
		doPlayerSendTextMessage(cid,22,"Sorry but only VIP players.")
		doTeleportThing(cid, frompos)
end
end