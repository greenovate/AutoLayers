# AutoLayers Project Status

**Last Updated:** February 10, 2026  
**Current Version:** 1.0-beta.2  
**GitHub Repo:** greenovate/AutoLayers

## Overview

AutoLayers is a WoW TBC Anniversary addon for layer hopping. It's a fork of raizo's AutoLayer with bug fixes and improvements by evild.

## Completed Work

### 1. Repository Rename
- Renamed from `AutoLayered` to `AutoLayers` on GitHub

### 2. Addon Rename (Internal)
- Changed all `AutoLayer` references to `AutoLayers`
- Updated TOC title, SavedVariables (`AutoLayersDB`)
- Updated credits to `evild (fork of raizo's AutoLayer)`

### 3. Bug Fix: GetRaidRosterInfo in Groups
- **Problem:** Original code used `GetRaidRosterInfo()` which only works in raids, not party groups
- **Solution:** Added `IsInRaid()` check, fallback to party unit IDs (`party1`, `party2`, etc.) with `UnitExists`/`UnitIsConnected` for party groups
- **Files:** layering.lua lines ~282-302 and ~485-503

### 4. TOC File Fix
- **Problem:** Generic `.toc` file wasn't loaded by TBC Anniversary client
- **Solution:** Renamed to `AutoLayers_TBC.toc` (TBC Anniversary requires `_TBC.toc` suffix)
- **Interface Version:** 20505 (correct for TBC Anniversary)

### 5. First Launch Message
- Added welcome message on first launch: "AutoLayers v1.0-beta - You're welcome, -evild"
- Uses `firstLaunchSeen` flag in saved variables

### 6. Native Layer Detection (No NWB Dependency)
- **Problem:** Layer detection required NovaWorldBuffs addon
- **Solution:** Implemented native detection using NPC GUID zoneUID extraction
- **How it works:** 
  - GUID format: `Creature-0-[serverID]-[instanceID]-[zoneUID]-[npcID]-[spawnUID]`
  - When targeting any NPC, extract zoneUID (5th component)
  - Track unique zoneUIDs = unique layers
- **New Functions:**
  - `GetZoneUIDFromGUID(guid)` - extracts zoneUID from GUID
  - `OnTargetChanged()` - event handler for PLAYER_TARGET_CHANGED
  - `AutoLayers:getCurrentLayer()` - returns NWB layer if available, else native detection
  - `AutoLayers:getLayerCount()` - returns NWB layer count if available, else defaults to 20

### 7. Release Packaging
- **Problem:** GitHub auto-generated zips have wrong folder names (e.g., `AutoLayers-1-2.0-beta`)
- **Solution:** Manually create zip with correct `AutoLayers/` folder structure
- **Command:** `zip -r AutoLayers.zip AutoLayers -x "AutoLayers/.git/*" -x "AutoLayers/.git*"`

## File Structure

```
AutoLayers/
├── AutoLayers_TBC.toc    # Addon manifest (Interface 20505)
├── main.lua              # Addon init, options, slash commands
├── configuration.lua     # Settings getters/setters
├── layering.lua          # Core layer detection, invite processing
├── hopping.lua           # Layer hopper GUI
├── embeds.xml            # Library includes
├── Lib/                  # Ace3 and other libraries
├── Textures/             # Minimap icons
└── docs/                 # Documentation
```

## Key Functions Reference

### layering.lua
- `AutoLayers:getCurrentLayer()` - Returns current layer (NWB fallback to native)
- `AutoLayers:getLayerCount()` - Returns layer count (NWB or default 20)
- `AutoLayers:ProcessMessage()` - Handles chat messages for layer requests
- `AutoLayers:ProcessSystemMessages()` - Handles system messages
- `ProccessQueue()` - Sends queued messages to layer channels

### hopping.lua
- `AutoLayers:HopGUI()` - Opens layer hopper GUI
- `AutoLayers:SendLayerRequest()` - Sends layer request to chat
- `AutoLayers:SlashCommandRequest(input)` - Handles /autolayer req command

### main.lua
- `AutoLayers:OnInitialize()` - Addon initialization
- `AutoLayers:SlashCommand(input)` - Main slash command handler
- `AutoLayers:DebugPrint(...)` - Debug output (when debug mode enabled)

## Known Issues / TODO

1. **Layer detection requires targeting**: User must target an NPC to detect layer. Could add:
   - Mouseover detection
   - Nameplate detection
   - Combat log detection

2. **Version bumping**: Remember to bump version in `AutoLayers_TBC.toc` for each release

## Important Notes for Future Context

### File Load Order (per TOC)
1. embeds.xml (libraries)
2. main.lua (creates AutoLayers addon object)
3. configuration.lua
4. layering.lua
5. hopping.lua

### Common Errors Fixed
- `send_queue nil` error: Initialize `addonTable.send_queue = addonTable.send_queue or {}` at top of layering.lua
- `HopGUI nil` error: hopping.lua was truncated, missing closing `end` statements
- `getLayerCount nil` error: Function wasn't defined, added to layering.lua

### Testing Checklist
- [ ] Addon loads without errors
- [ ] Minimap button appears
- [ ] Left-click opens settings
- [ ] Right-click opens hopper GUI
- [ ] Layer detection works when targeting NPCs
- [ ] Layer requests send to chat
- [ ] First launch message shows once

## Release Commands

```bash
cd /Users/evilaptop/Documents/codework/Wow_Addons/AutoLayers

# Bump version
sed -i '' 's/Version: OLD/Version: NEW/' AutoLayers_TBC.toc

# Commit
git add -A && git commit -m "Message" && git push

# Create release zip
cd .. && rm -f AutoLayers.zip && zip -r AutoLayers.zip AutoLayers -x "AutoLayers/.git/*" -x "AutoLayers/.git*"

# Upload to release
gh release upload v1.0-beta AutoLayers.zip --repo greenovate/AutoLayers --clobber
```
