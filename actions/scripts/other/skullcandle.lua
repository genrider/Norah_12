function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
		if target:getId() == 2047 then
			item:remove(1)
			target:transform(5812,0)
			return true
		end
	return false
end