--function onKill(player, target)
function onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
	if creature:isPlayer() or creature:getMaster() then
		return true
	end

	local targetName, taskId = creature:getName():lower()
	for i = 1, #killer:getStartedTasks() do
		taskId = killer:getStartedTasks()[i]
		if isInArray(tasks[taskId].creatures, targetName) then
			local killAmount = killer:getStorageValue(KILLSSTORAGE_BASE + taskId)
			if killAmount < tasks[taskId].killsRequired then
				killer:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)
				killer:sendTextMessage(MESSAGE_INFO_DESCR,tasks[taskId].raceName .. ": " .. killer:getStorageValue(KILLSSTORAGE_BASE + taskId) .. "/" .. tasks[taskId].killsRequired)
			end
		end
	end
	return true
end