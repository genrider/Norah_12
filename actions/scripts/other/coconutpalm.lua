function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(2726)
	item:decay()
	Game.createItem(2678, 3, fromPosition)
	return true
end
