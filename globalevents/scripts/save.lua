function onThink(interval)
	--saveServer()
	broadcastMessage("Server save within 30 seconds!", MESSAGE_STATUS_WARNING)
	addEvent(saveServer, 30000)
	return true
end
