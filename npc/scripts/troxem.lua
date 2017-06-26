local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

	
---BUY---
shopModule:addBuyableItem({'blank paper'}, 			1947, 2,		'blank paper')
shopModule:addBuyableItem({'perchment'},			1951, 8,		'perchment')
shopModule:addBuyableItem({'scroll'},				1949, 5,		'scroll')
shopModule:addBuyableItem({'document'},				1952, 15,		'document')
shopModule:addBuyableItem({'book'},					1974, 15,		'book')
shopModule:addBuyableItem({'book'},					1972, 20,		'book')
shopModule:addBuyableItem({'book'},					1973, 10,		'book')
shopModule:addBuyableItem({'book'},					1975, 30,		'book')
shopModule:addBuyableItem({'book'},					1971, 20,		'book')
shopModule:addBuyableItem({'book'},					1977, 24,		'book')
shopModule:addBuyableItem({'book'},					1978, 22,		'book')
shopModule:addBuyableItem({'book'},					1979, 35,		'book')
shopModule:addBuyableItem({'book'},					1981, 18,		'book')
shopModule:addBuyableItem({'book'},					1980, 18,		'book')

---SELL---
shopModule:addSellableItem({'gemmed book'},				1976, 450,		'gemmed book')
shopModule:addSellableItem({'old perchment'},			4842, 450,		'old perchment')
shopModule:addSellableItem({'scroll'},					1949, 4,		'scroll')
shopModule:addSellableItem({'purple tome'},				1982, 1200,		'purple tome')
shopModule:addSellableItem({'green tome'},				1983, 1200,		'green tome')
shopModule:addSellableItem({'blue tome'},				1984, 1200,		'blue tome')
shopModule:addSellableItem({'grey tome'},				1985, 1200,		'grey tome')
shopModule:addSellableItem({'red tome'},				1986, 1200,		'red tome')
shopModule:addSellableItem({'holy Tible'},				1970, 1200,		'holy Tible')
shopModule:addSellableItem({'map'},						1957, 35,		'map')
shopModule:addSellableItem({'book'},					1961, 35,		'book')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Greetings reader..")
npcHandler:addModule(FocusModule:new())  