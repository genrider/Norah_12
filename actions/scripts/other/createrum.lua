function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId = target:getId()
	if targetId == 5470 then
		item:remove(1)
		target:transform(5514,0)
		return true
	end
	return false
end
