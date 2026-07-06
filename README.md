# summon-claude

Hot corner trigger for Claude Desktop's Quick Entry overlay on macOS, built with [Hammerspoon](https://www.hammerspoon.org/).

## What it does

Move your cursor to the top-right corner of the screen to instantly open Claude's Quick Entry popup — the same floating input box you get by clicking the Claude icon in the menu bar tray. No custom UI, no extra windows — just a fast, native way to reach Claude from anywhere.

## How it works

Instead of simulating a keyboard shortcut (which on some versions of Claude Desktop opens a full chat window instead of the floating overlay), this script finds Claude's menu bar tray icon via macOS's Accessibility API and simulates a click on it directly — triggering the exact same overlay you'd get by clicking it yourself.

## Requirements

- macOS
- [Hammerspoon](https://www.hammerspoon.org/) installed, with Accessibility permissions granted
- Claude Desktop app running (can be in the background — no need for the main window to be open)

## Installation

1. Install Hammerspoon if you don't have it: `brew install --cask hammerspoon`
2. Copy `init.lua` from this repo into `~/.hammerspoon/init.lua`
3. Grant Hammerspoon Accessibility permissions (System Settings → Privacy & Security → Accessibility)
4. Make sure Claude Desktop is running (menu bar icon should be visible)
5. Reload the Hammerspoon config (menu bar icon → Reload Config)
6. Move your cursor to the top-right corner of the screen 🎉

## Customization

- `CORNER_SIZE` — how many pixels from the corner trigger the popup (default: 5)

## Troubleshooting

If nothing happens when you hit the corner:

1. Open the Hammerspoon Console (menu bar icon → Console) and run:
```lua
   hs.inspect(hs.application.runningApplications())
```
2. Find the exact process name for Claude Desktop in the list and update the `"Claude"` string in `init.lua` if it differs.
3. Make sure Claude Desktop's tray icon is actually visible in the menu bar — if it's hidden, the script won't find it.

## License

MIT
