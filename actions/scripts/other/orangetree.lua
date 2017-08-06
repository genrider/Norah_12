function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(4008)
	item:decay()
	Game.createItem(2675, 4, fromPosition)
	return true
end
