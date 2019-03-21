function onStepIn(cid, item, pos, frompos)
local pos = {x= 1014, y= 1054, z= 7}
local outfit = getCreatureOutfit(cid)
local redteam = {lookType = outfit.lookType, lookHead = 0, lookAddons = outfit.lookAddons, lookLegs = 86, lookBody = 86, lookFeet = 0}
	if isPlayer(cid) == TRUE and item.actionid == 6968 and getPlayerStorageValue(cid,1337) == 1 then
		doTeleportThing(cid, pos)
		doCreatureChangeOutfit(cid, redteam)
		doPlayerSendTextMessage(cid,22,"You're now on the blue & white team!")
	else
		doPlayerSendTextMessage(cid,22,"Sorry, you haven\'t proven you are worthy yet!")
		doTeleportThing(cid, frompos)
end
end