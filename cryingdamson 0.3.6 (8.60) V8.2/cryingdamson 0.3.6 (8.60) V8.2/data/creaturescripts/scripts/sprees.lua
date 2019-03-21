function onKill(cid, target, lastHit)
		if(getPlayerFrags(cid) == 4) then
			broadcastMessage(getCreatureName(cid) .. " is on a killing spree! He killed 5 players!")
			doCreatureSetSkullType(cid, 3)	-- 3 is white
			doPlayerAddItem(cid, 2148, 5)
		end
 
		if(getPlayerFrags(cid) == 9) then
			broadcastMessage(getCreatureName(cid) .. " is dominating! He killed 10 players!")
			doCreatureSetSkullType(cid, 4)  -- 4 is red
			doPlayerAddItem(cid, 2640, 10)
		end
 
		if(getPlayerFrags(cid) == 24) then
			broadcastMessage(getCreatureName(cid) .. " is CRAZY! He killed 25 players!")
			doCreatureSetSkullType(cid, 5)  -- 5 is black
			doPlayerAddItem(cid, 2640, 25)
		end
 
		if(getPlayerFrags(cid) == 49) then
			broadcastMessage(getCreatureName(cid) .. " is UNSTOPPABLE!! He killed 50 players! DO SOMETHING!")
			doPlayerAddItem(cid, 2640, 50) 
		end
 
		if(getPlayerFrags(cid) == 99) then
			broadcastMessage("Bow down to your new god! " ..getCreatureName(cid).. " has 100 frags!")
			doPlayerAddItem(cid, 8266, 100) 
		end
 
		if(getPlayerFrags(cid) == 149) then
			broadcastMessage(getCreatureName(cid) .. " is not a human! He killed 150 players!")
			doPlayerAddItem(cid, 9932, 150)
		else
	return true
	end
end
