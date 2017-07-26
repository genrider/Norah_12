function onUse(cid, item, frompos, item2, topos)
local config = {
	[5640] = {item = 23816},
	[5641] = {item = 2137}
}
local p = Player(cid)
local v = config[item.uid]

if v and p:getStorageValue(17185) == -1 then
		p:addItem(v.item,1) 
		p:sendTextMessage(MESSAGE_INFO_DESCR,"You have found a " .. getItemName(v.item) ..".")
		p:setStorageValue(17185,1)
	else
		p:sendTextMessage(MESSAGE_INFO_DESCR, "The " .. getItemName(item.itemid) .. " is empty.")
end
return true
end