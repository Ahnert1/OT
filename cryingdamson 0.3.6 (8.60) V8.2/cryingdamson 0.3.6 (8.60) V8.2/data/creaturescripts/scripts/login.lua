local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	if (getConfigValue("accountManager") == FALSE and getCreatureName(cid) == "Account Manager") then
		return false
	end
	
	if getPlayerStorageValue(cid, 1337) == 1 then
		doPlayerSendTextMessage(cid,  MESSAGE_INFO_DESCR, "Visit \[Alesso\] for free supplies!")
	end

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	registerCreatureEvent(cid, "magicadvance")	
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "KillPlayer")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid,'SpellUp')
	registerCreatureEvent(cid, "balance")
	registerCreatureEvent(cid, "deposit")
	registerCreatureEvent(cid, "deposit_all")
	registerCreatureEvent(cid, "withdraw")
	registerCreatureEvent(cid, "withdraw_all")
	registerCreatureEvent(cid, "transfer")
	registerCreatureEvent(cid, "transfer_all")
	registerCreatureEvent(cid, "Bless")
	registerCreatureEvent(cid, "fragsonlook")
	registerCreatureEvent(cid, "sprees")
	registerCreatureEvent(cid, "startlevel")



	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "lvlup")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "AdvanceSave")
	return true
end
