local addonName, addonTable = ...

function AutoLayers:SetDebug(info, val)
	AutoLayers:DebugPrint("SetDebug", info, val)
	self.db.profile.debug = val
end

function AutoLayers:GetDebug(info)
	return self.db.profile.debug
end

function AutoLayers:SetEnabled(info, val)
	AutoLayers:DebugPrint("SetEnabled", info, val)
	self.db.profile.enabled = val
end

function AutoLayers:GetEnabled(info)
	return self.db.profile.enabled
end

function AutoLayers:SetTriggers(info, val)
	AutoLayers:DebugPrint("SetTriggers", info, val)
	self.db.profile.triggers = val
end

function AutoLayers:GetTriggers(info)
	return self.db.profile.triggers
end

function AutoLayers:ParseTriggers()
	local triggers = {}
	for trigger in string.gmatch(self.db.profile.triggers, "[^,]+") do
		table.insert(triggers, string.lower("*" .. trigger .. "*"))
	end
	return triggers
end

function AutoLayers:SetBlacklist(info, val)
	AutoLayers:DebugPrint("SetBlacklist", info, val)
	self.db.profile.blacklist = val
end

function AutoLayers:GetBlacklist(info)
	return self.db.profile.blacklist
end

function AutoLayers:ParseBlacklist()
	local blacklist = {}
	for trigger in string.gmatch(self.db.profile.blacklist, "[^,]+") do
		table.insert(blacklist, trigger)
	end
	return blacklist
end

function AutoLayers:SetInvertKeywords(info, val)
	AutoLayers:DebugPrint("SetInvertKeywords", info, val)
	self.db.profile.invertKeywords = val
end

function AutoLayers:GetInvertKeywords(info)
	return self.db.profile.invertKeywords
end

function AutoLayers:ParseInvertKeywords()
	local invertKeywords = {}
	for keyword in string.gmatch(self.db.profile.invertKeywords, "[^,]+") do
		table.insert(invertKeywords, keyword)
	end
	return invertKeywords
end

function AutoLayers:GetFilteredChannels(info)
	return self.db.profile.filteredChannels
end

function AutoLayers:ParseFilteredChannels()
	local filteredChannels = {}
	for channel in string.gmatch(self.db.profile.filteredChannels, "[^,]+") do
		table.insert(filteredChannels, string.lower(channel))
	end
	return filteredChannels
end

local bunnyLDB = ...

function AutoLayers:Toggle()
	self.db.profile.enabled = not self.db.profile.enabled
	self:Print(self.db.profile.enabled and "enabled" or "disabled")

	if self.db.profile.enabled then
		if self.db.profile.hideAutoWhispers then
			self.filterChatEventAutoLayersWhisperMessages()
		end
		if self.db.profile.hideSystemGroupMessages then
			self:filterChatEventSystemGroupMessages()
		end

		addonTable.bunnyLDB.icon = [[Interface\AddOns\AutoLayers\Textures\AutoLayers_enabled_icon]]
	else
		if self.db.profile.hideAutoWhispers then
			self.unfilterChatEventAutoLayersWhisperMessages()
		end
		if self.db.profile.hideSystemGroupMessages then
			self:unfilterChatEventSystemGroupMessages()
		end

		addonTable.bunnyLDB.icon = [[Interface\AddOns\AutoLayers\Textures\AutoLayers_disabled_icon]]
	end
end
