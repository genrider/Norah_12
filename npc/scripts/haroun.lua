local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
local player = Player(cid)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
----------------------START----------------------
if msgcontains(msg, 'enchanted chicken wing') or msgcontains(msg, 'enchanted chicken') or msgcontains(msg, 'wing') then
	npcHandler:say('Huumm... it\'s possible, just give me {boots of haste}, they have imbued part i need to give you enchanted chicken wing. Did you have it them?', cid)
	npcHandler.topic[cid] = 1
elseif msgcontains(msg, 'fighting spirit') or msgcontains(msg, 'spirit') then
	npcHandler:say('I have some {fighting spirits} in magazine. I can sell one of them for {two royal helmets}, I need them now, so shall we trade?', cid)
	npcHandler.topic[cid] = 2
elseif msgcontains(msg, 'magic sulphur') or msgcontains(msg, 'sulphur')  then
	npcHandler:say('Do you have any items imbued with magic fire? Im in need of {fire swords}, if you have {three} i can trade you one magic sulphur for them.', cid)
	npcHandler.topic[cid] = 3
elseif msgcontains(msg, 'warrior\'s sweat') or msgcontains(msg, 'flask') or msgcontains(msg, 'sweat') then
	npcHandler:say('It\'s rare But i have a contract for four helmets.If you bring me {four warrior helmets}, i\'ll give you flask that contains some {warrior\'s sweat}.', cid)
	npcHandler.topic[cid] = 4
	
------------------YES-------------------------------------	
elseif msgcontains(msg, 'yes') then
	if npcHandler.topic[cid] == 1 then
		if player:getItemCount(2195) >= 1 then
			npcHandler:say('I like doing business with you! Take this.', cid)
			player:removeItem(2195,1)
			player:addItem(5891,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('Come back when you have items i need!', cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		if player:getItemCount(2498) >= 2 then
			npcHandler:say('I like doing business with you! Take this.', cid)
			player:removeItem(2498,2)
			player:addItem(5884,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('back when you have items i need!', cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if player:getItemCount(2392) >= 3 then
			npcHandler:say('I like doing business with you! Take this.', cid)
			player:removeItem(2392,3)
			player:addItem(5904,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('back when you have items i need!', cid)
		end
	elseif npcHandler.topic[cid] == 4 then
		if player:getItemCount(2475) >= 4 then
			npcHandler:say('I like doing business with you! Take this.', cid)
			player:removeItem(2475,4)
			player:addItem(5885,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('back when you have items i need!', cid)
		end
	end
elseif msgcontains(msg, 'no') or msgcontains(msg, 'nah') then
	npcHandler:say('Ohh... ok, maybe next time...', cid)
	npcHandler.topic[cid] = 0
end
----------------------END----------------------
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
