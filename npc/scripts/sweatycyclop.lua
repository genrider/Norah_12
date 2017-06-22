local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

local player = Player(cid)

	if msgcontains(msg, "cup of molten gold") then
		npcHandler:say("Ahh runny gold! You want runny gold you give me hard gold, much gold. You have it?", cid)
		npcHandler.topic[cid] = 1	
	elseif msgcontains(msg, "royal steel") then
		npcHandler:say("Shiny alloy. Give me bright funny armor. Armor you humans be wearing. Do you have it?", cid)
		npcHandler.topic[cid] = 2	
	elseif msgcontains(msg, "draconian steel") then
		npcHandler:say("Dragon rock. Give me item that help fight dragon. Will make one for you.", cid)
		npcHandler.topic[cid] = 3	
	elseif msgcontains(msg, "hell steel") then
		npcHandler:say("Bad and hot. Me dont want but if you bring me evil helmet me help you.", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "crude iron") then
		npcHandler:say("Very big, very heavy. Give me very big sword.", cid)
		npcHandler.topic[cid] = 5	
	elseif msgcontains(msg, "gear wheel") then
		npcHandler:say("Why you want? Give me ore and me make some for you.", cid)
		npcHandler.topic[cid] = 6		
	elseif msgcontains(msg, "infernal bolt") then
		npcHandler:say("Me no expert but can help you. Give me black ball. Demons have black ball go hunt.", cid)
		npcHandler.topic[cid] = 7				
	
	--YES--
	elseif msgcontains(msg, "yes") then
		-- Gold Ignot
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid,9971) >= 1 then
				player:removeItem(9971, 1)
				npcHandler:say("whoooosh There!", cid)
				player:addItem(13941, 1)
			else
			npcHandler:say("Uhmm. Where is thingy?", cid)
		end
		-- Crown Armor
		elseif npcHandler.topic[cid] == 2 then
			if getPlayerItemCount(cid,2487) >= 1 then
				player:removeItem(2487, 1)
				npcHandler:say("Cling clang!", cid)
				player:addItem(5887, 1)
			else
			npcHandler:say("Uhmm. Where is thingy?", cid)
		end
		-- Dragon Shield
		elseif npcHandler.topic[cid] == 3 then
			if getPlayerItemCount(cid,2516) >= 1 then
				player:removeItem(2516, 1)
				npcHandler:say("Cling clang!", cid)
				player:addItem(5889, 1)
			else
			npcHandler:say("Uhmm. Where is thingy?", cid)
		end
		-- Devil Helmet
		elseif npcHandler.topic[cid] == 4 then
			if getPlayerItemCount(cid,2462) >= 1 then
				player:removeItem(2462, 1)
				npcHandler:say("Cling clang!", cid)
				player:addItem(5888, 1)
			else
			npcHandler:say("Uhmm. Where is thingy?", cid)
		end
		-- Giant Sword
		elseif npcHandler.topic[cid] == 5 then
			if getPlayerItemCount(cid,2393) >= 1 then
				player:removeItem(2393, 1)
				npcHandler:say("Cling clang!", cid)
				player:addItem(5892, 1)
			else
			npcHandler:say("Uhmm. Where is thingy?", cid)
		end
		-- Iron Ore
		elseif npcHandler.topic[cid] == 6 then
			if getPlayerItemCount(cid,5880) >= 1 then
				player:removeItem(5880, 1)
				npcHandler:say("Cling clang!", cid)
				npcHandler.topic[cid] = 0
				player:addItem(9690, 1)
			else
			npcHandler:say("Uhmm. Where is thingy?", cid)
		end
		-- Soul Orb
		elseif npcHandler.topic[cid] == 7 then
			if player:getItemCount(5944) > 0 then
				local count = player:getItemCount(5944)
				for i = 1, count do
					if math.random(100) <= 1 then
						player:addItem(6529, 6)
						player:removeItem(5944, 1)
					else
						player:addItem(6529, 3)
						player:removeItem(5944, 1)
					end
				end
				npcHandler:say("Cling clang!", cid)
			else
			npcHandler:say("Uhmm. Where is thingy", cid)
		end
	end
end
return true
end

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "Me make stuff.{cup of molten gold}, {hell steel}, {royal steel}, {draconian steel}, {crude iron}, {infernal bolt} and {gear wheel}."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Me blacksmith."})
keywordHandler:addKeyword({'smith'}, StdModule.say, {npcHandler = npcHandler, text = "Yes, me."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hum Humm! Welcume lil' |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye lil' one.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye lil' one.")
npcHandler:addModule(FocusModule:new())
