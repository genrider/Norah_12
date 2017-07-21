local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end		
	
	local player = Player(cid)
	
	if msgcontains(msg, "rice") then
		npcHandler:say("Bring me 2 bunch of ripe rice. Have you got it?",cid)
		npcHandler.topic[cid] = 1
		return true
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid,11245) >= 2 then
				player:removeItem(11245, 2)
				player:addItem(11246,10)
				npcHandler:say("There is your rice balls", cid)
			else
				npcHandler:say("You do not have so many items.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
end	

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
