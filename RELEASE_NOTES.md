## AutoLayers v1.0-beta.4

Built by evild - Fork of AutoLayer with bug fixes for TBC Anniversary

### What's New in beta.4

- **Consistent layer numbering** - Layers are now numbered by zoneUID (lowest zoneUID = Layer 1, next = Layer 2, etc.)
- **This matches how other players number layers** - all players who have seen the same layers will use the same numbering
- **Persisted layer data** - Detected layers are saved between sessions, so numbering stays consistent across logins
- No longer requires NovaWorldBuffs for consistent layer numbers!

### Previous Changes

**beta.3:**
- Fixed layer numbering to use NWB's data when available

**beta.2:**
- Native layer detection - Detects layers automatically when you target any NPC
- Fixed hopping.lua structure issues
- Fixed missing getLayerCount function
- Fixed send_queue initialization error

**beta.1:**
- Renamed addon from AutoLayer to AutoLayers
- Fixed critical bug: GetRaidRosterInfo error when in a party group (not raid)
- Fixed TOC for TBC Anniversary (uses _TBC.toc suffix with Interface 20505)
- Added first-launch welcome message

### How Layer Numbering Works

Every server layer has a unique "zoneUID" that appears in NPC GUIDs. We sort all known zoneUIDs numerically:
- Lowest zoneUID → Layer 1
- Second lowest → Layer 2
- etc.

This creates consistency across all players. As you discover more layers, numbering may shift, but once everyone has seen the same layers, all numbers match.

### Installation

1. Download `AutoLayers.zip` (NOT the source code)
2. Extract - it already contains the `AutoLayers/` folder
3. Place the `AutoLayers` folder in your `Interface/AddOns` directory
4. Restart WoW or type `/reload`

### Usage

- `/autolayers` or `/al` - Open settings
- Left-click minimap icon to toggle
- Right-click minimap icon for layer hopper
- **Target any NPC** to detect your current layer

You're welcome,
-evild
