## AutoLayers v1.0-beta.2

Built by evild - Fork of AutoLayer with bug fixes for TBC Anniversary

### What's New in beta.2

- **Native layer detection** - No longer requires NovaWorldBuffs! Detects your layer automatically when you target any NPC
- Fixed hopping.lua structure issues
- Fixed missing getLayerCount function
- Fixed send_queue initialization error

### Previous Changes (beta.1)

- Renamed addon from AutoLayer to AutoLayers
- Fixed critical bug: GetRaidRosterInfo error when in a party group (not raid)
- Fixed TOC for TBC Anniversary (uses _TBC.toc suffix with Interface 20505)
- Added first-launch welcome message

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
