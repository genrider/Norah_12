function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(5092)
	item:decay()
	Game.createItem(2676, 6, fromPosition)
	return true
end
