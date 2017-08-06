function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(5156)
	item:decay()
	Game.createItem(5097, 3, fromPosition)
	return true
end
