function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(5093)
	item:decay()
	Game.createItem(2676, 3, fromPosition)
	return true
end
