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

	if msgcontains(msg, "dragon") then
		npcHandler:say("Dragons occupy the mountain in front of the bridge. Be carefull, on highter parts of the mountain you will meet Dragon Lords.", cid)
	elseif msgcontains(msg, "smuggler") or msgcontains(msg, "bandit") or msgcontains(msg, "wild warrior") then
		npcHandler:say("They are just in front of the bridge", cid)
	elseif msgcontains(msg, "cyclop") then
		npcHandler:say("Hmm cyclops... One-eyed, big, muscular giants. They lives in south part of mountains in front of bridge. They have two camps.", cid)
	elseif msgcontains(msg, "minotaur") then
		npcHandler:say("Ugh! Stinking cows resembling people, live along the river. At once, when you left the bridge just head north. I hear that they hide a special knife, what help you rip their skin.", cid)
	elseif msgcontains(msg, "dwarf") or msgcontains(msg, "nightmare") or msgcontains(msg, "werewolf") then
		npcHandler:say("I don\'t know where they are, but if think, that [Morila]", cid)
	elseif msgcontains(msg, "Morila") then
		npcHandler:say("His house is located near south city gate.", cid)
	elseif msgcontains(msg, "your trophy") then
		npcHandler:say("Fuck off! Never come here again!", cid)
	elseif msgcontains(msg, "surroundings") or msgcontains(msg, "monster") then
		npcHandler:say("za tym jebanym mostem znajdziesz troche {bandit} jakies {smuggler} albo {cyclops} troche na polnoc chodza {minotaur} i wiele innych o ktorych tez moge ci opowiedziec.", cid)
	end	
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi, what brigs you here? Want to know something about monsters? Say who you are interested in? Meaby, you want hear about {surroundings}")
npcHandler:addModule(FocusModule:new())  