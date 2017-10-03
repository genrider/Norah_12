local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	local playerId = player:getId()

	-- Stamina
	nextUseStaminaTime[playerId] = 1

	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	--Prey Stamina
	nextUseStaminaPrey[playerId+1] = {Time = 1}
	nextUseStaminaPrey[playerId+2] = {Time = 1}
	nextUseStaminaPrey[playerId+3] = {Time = 1}

	-- Prey Data
	if (player:getVocation():getId() ~= 0) then
		local columnUnlocked = getUnlockedColumn(player)
		if (not columnUnlocked) then
			columnUnlocked = 0
		end

		for i = 0, columnUnlocked do
			sendPreyData(player, i)
		end
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("BossParticipation")
	player:registerEvent("MonsterCounter")
    player:registerEvent("KillingInTheNameOfKills")
    player:registerEvent("inServiceOfYalaharQuestsMorik")
	player:registerEvent("SvargrondArenaKill")
	player:registerEvent("AdvanceSave")
	player:registerEvent("petlogin")
	player:registerEvent("petthink")

	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end
	db.query('INSERT INTO `players_online` (`player_id`) VALUES (' .. playerId .. ')')

	return true
end
