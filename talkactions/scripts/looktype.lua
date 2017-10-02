-- keep it ordered
local invalidTypes = {
	1, 135, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173,
	174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
	189, 190, 191, 411, 415, 424, 439, 440, 468, 469, 474, 475, 476, 477, 478,
	479, 480, 481, 482, 483, 484, 485, 501, 518, 519, 520, 524, 525, 536, 543,
	549, 576, 581, 582, 597, 616, 623, 625, 638, 639, 640, 641, 642, 643, 645,
	646, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 701, 702,
	703, 704, 705, 706, 707, 708, 709, 710, 711, 713, 715, 718, 719, 722, 723,
	737, 741, 742, 743, 744, 748, 751, 752, 753, 754, 755, 756, 757, 758, 764,
	765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779,
	780,781
	
}

function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local lookType = tonumber(param)
	if lookType >= 0 and lookType < 800 and not table.contains(invalidTypes, lookType) then
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
	else
		player:sendCancelMessage("A look type with that id does not exist.")
	end
	return false
end
