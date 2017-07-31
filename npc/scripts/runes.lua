local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

	-------RUNES------
	shopModule:addBuyableItem({'blank rune'}, 				2260, 10,		'blank rune')
	--[[]]--
	------Attack------
	shopModule:addBuyableItem({'light magic missile rune'}, 2287, 12,		'light magic missile rune')
	shopModule:addBuyableItem({'heavy magic missile rune'}, 2311, 36,		'heavy magic missile rune')
	shopModule:addBuyableItem({'stalagmite rune'}, 			2292, 36,		'stalagmite rune')
	shopModule:addBuyableItem({'holy missile rune'}, 		2295, 48,		'holy missile rune')
	shopModule:addBuyableItem({'icicle rune'}, 				2271, 90,		'icicle rune')
	shopModule:addBuyableItem({'fireball rune'}, 			2302, 90,		'fireball rune')
	shopModule:addBuyableItem({'explosion rune'}, 			2313, 93,		'explosion rune')
	shopModule:addBuyableItem({'thunderstorm rune'}, 		2315, 111,		'thunderstorm rune')
	shopModule:addBuyableItem({'avalanche rune'}, 			2274, 135,		'avalanche rune')
	shopModule:addBuyableItem({'great fireball rune'}, 		2304, 135,		'great fireball rune')
	shopModule:addBuyableItem({'soulfire rune'}, 			2308, 138,		'soulfire rune')
	shopModule:addBuyableItem({'sudden death rune'}, 		2268, 324,		'sudden death rune')
	shopModule:addBuyableItem({'magic wall rune'}, 			2293, 348,		'magic wall rune')
	------Healing------
	shopModule:addBuyableItem({'cure poison rune'}, 		2266, 192,		'cure poison rune')
	shopModule:addBuyableItem({'intense healing rune'}, 	2265, 285,		'intense healing rune') --
	shopModule:addBuyableItem({'ultimate healing rune'}, 	2273, 525,		'ultimate healing rune')
	------Field------
	shopModule:addBuyableItem({'poison field rune'}, 		2285, 63,		'poison field rune')
	shopModule:addBuyableItem({'fire field rune'}, 			2301, 84,		'fire field rune')
	shopModule:addBuyableItem({'energy field rune'}, 		2277, 114,		'energy field rune')
	shopModule:addBuyableItem({'poison wall rune'}, 		2289, 156,		'poison wall rune')
	shopModule:addBuyableItem({'fire wall rune'}, 			2303, 183,		'fire wall rune')
	shopModule:addBuyableItem({'energy wall rune'}, 		2279, 255,		'energy wall rune')
	shopModule:addBuyableItem({'poison bomb rune'}, 		2286, 255,		'poison bomb rune')
	shopModule:addBuyableItem({'fire bomb rune'}, 			2305, 351,		'fire bomb rune')
	shopModule:addBuyableItem({'energy bomb rune'}, 		2262, 486,		'energy bomb rune')
	------Summon------
	shopModule:addBuyableItem({'convince creature rune'}, 	2290, 240,		'convince creature rune')
	shopModule:addBuyableItem({'animate dead rune'}, 		2316, 1125,		'animate dead rune')
	------Support-----
	shopModule:addBuyableItem({'chameleon rune'}, 			2291, 630,		'chameleon rune')
	shopModule:addBuyableItem({'destroy field rune'}, 		2261, 45,		'destroy field rune')
	shopModule:addBuyableItem({'paralyze rune'}, 			2278, 2100,		'paralyze rune')
	shopModule:addBuyableItem({'wild growth rune'}, 		2269, 480,		'wild growth rune')
	


keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "I'm selling runes. If you like to see my offers, ask me for a {trade}."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi there |PLAYERNAME|, and welcome to the {magic} store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at {runes}?")
npcHandler:addModule(FocusModule:new())