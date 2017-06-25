local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
local player = Player(cid)

	if msgcontains(msg, "dragon") then
		npcHandler:say("Dragons occupy the mountain in front of the bridge. Be carefull, on highter parts of the mountain you will meet Dragon Lords.", cid)
	end
	else if msgcontains(msg, "smuggler") or msgcontains(msg, "bandit") or msgcontains(msg, "wild warrior") then
		npcHandler:say("They are just in front of the bridge")
	end
	else if msgcontains(msg, "cyclop") then
		npcHandler:say("Hmm cyclops... One-eyed, big, muscular giants. They lives in south part of mountains in front of bridge. They have two camps.")
	end
	else if msgcontains(msg, "minotaur") then
		npcHandler:say("Ugh! Stinking cows resembling people, live along the river. At once, when you left the bridge just head north. I hear that they hide a special knife, what help you rip their skin.")
	end
	else if msgcontains(msg, "dwarf") or msgcontains(msg, "nightmare") or msgcontains(msg, "werewolf") then
		npcHandler:say("I don\'t know where they are, but if think, that [Morila]")
	end
	else if msgcontains(msg, "Morila") then
		npcHandler:say("His house is located near south city gate.")
	end
	if msgcontains(msg, "your trophy") then
		npcHandler:say("Fuck off! Never come here again!")
	else	
end 
npcHandler:setMessage(MESSAGE_GREET, "Hi, what brigs you here? Want to know something about monsters? Say who you are interested in?")
npcHandler:addModule(FocusModule:new())  