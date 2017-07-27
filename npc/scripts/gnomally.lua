local array = {
    ["Gill Gugel"] = {id = 18398, cost = 10}, 
    ["Gill Coat"] = {id = 18399, cost = 10}, 
    ["Gill Legs"] = {id = 18400, cost = 10}, 
    ["Spellbook of Vigilance"] = {id = 18401, cost = 10}, 
    ["Prismatic Helmet"] = {id = 18403, cost = 10}, 
    ["Prismatic Armor"] = {id = 18404, cost = 10}, 
    ["Prismatic Legs"] = {id = 18405, cost = 10}, 
    ["Prismatic Boots"] = {id = 18406, cost = 10}, 
    ["Prismatic Shield"] = {id = 18410, cost = 10}, 
    ["Iron Loadstone"] = {id = 18447, cost = 20}, 
    ["Glow Wine"] = {id = 18448, cost = 20}
}


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local variant = {}
local talk_state = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	
	local t = array[msg]
	
	if array[msg] then
		npcHandler:say('Do you have for me {' .. t.cost .. ' major crystalline tokens}?', cid)
		talk_state[cid] = 1
		variant[cid] = msg:lower()
	elseif msgcontains(msg, 'yes') and talk_state[cid] == 1 then 
		local t = array[variant[cid]]
		if variant[cid] == nil then
			return true
		end
		if Player(cid):getFreeCapacity() >= ItemType(t.id):getWeight() then
			if getPlayerItemCount(cid, 18423) >= t.cost then
				doPlayerAddItem(cid,t.id,1)
				doPlayerRemoveItem(cid,18423,t.cost)
			else
				npcHandler:say('You don\'t have ' .. t.cost .. ' major crystalline tokens.',cid)
				variant[cid] = nil
				talk_state[cid] = nil
			end
		
		else
			Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, 'It\'s too heavy.')
			variant[cid] = nil
			talk_state[cid] = nil
		end
		

end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello. If you give me some major crystalline tokens, I will give you special items.")
npcHandler:addModule(FocusModule:new())  