local liquidContainers = {1775, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2023, 2031, 2032, 2033}
local millstones = {1381, 1382, 1383, 1384}
local ovens = {1786, 1788, 1790, 1792, 6356, 6358, 6360, 6362}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	if itemId == 2692 then
		if target.type == 1 and isInArray(liquidContainers, target.itemid) then
			item:remove(1)
			player:addItem(2693, 1)
			target:transform(target.itemid, 0)
			return true
		end
	elseif isInArray(millstones, target.itemid) then
		item:remove(1)
		player:addItem(2692, 1)
		return true
	elseif itemId == 2693 then
		if isInArray(ovens, target.itemid) then
			item:remove(1)
			player:addItem(2691, 1)
			return true
		elseif target.itemid == 2561 then
			item:remove(1)
			target:transform(8848, 0)
			return true
		end
	elseif itemId == 8848 then
		if isInArray(ovens, target.itemid) then
			item:transform(2561,0)
			player:addItem(2687, 12)
			return true
		end
	end
	return false
end
