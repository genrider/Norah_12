local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
local player = Player(cid)

	if msgcontains(msg, "help") then
		npcHandler:say("How can I help you? {monsters} {equipment}", cid)
	elseif msgcontains(msg, "monsters") then
		npcHandler:say("I never leave gates. But I know who can you help with it. In the difrent parts of city, you can find citizens who know the terrain around the city. The look like hunters, but it is very likely that they never hunted.", cid)
	elseif msgcontains(msg, "equipment") then
		npcHandler:say("Smugglers hide Plate Legs and Plate Armor. Propably under city you can find spirit cloak and double axe.", cid)
	end
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello, beginner hero. I\'m Guide. If you have any question, just ask me. I can {help} you find yourself in Pont Vanis.")
npcHandler:addModule(FocusModule:new())  