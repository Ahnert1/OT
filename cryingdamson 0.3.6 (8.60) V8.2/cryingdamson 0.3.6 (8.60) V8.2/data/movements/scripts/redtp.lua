function onStepIn(cid, item, pos, frompos)
local pos = {x= 1033, y= 1000, z= 7}
local outfit = getCreatureOutfit(cid)
local redteam = {lookType = outfit.lookType, lookHead = 114, lookAddons = outfit.lookAddons, lookLegs = 94, lookBody = 114, lookFeet = 114}
	if isPlayer(cid) == TRUE and item.actionid == 6969 and getPlayerStorageValue(cid,1337) == 1 then
		doTeleportThing(cid, pos)
		doCreatureChangeOutfit(cid, redteam)
		doPlayerSendTextMessage(cid,22,"You're now on the red & black team!")
	else
		doPlayerSendTextMessage(cid,22,"Sorry, you haven\'t proven you are worthy yet!")
		doTeleportThing(cid, frompos)
end
end