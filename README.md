# osrsified.nvim

An OSRS-inspired colorscheme and UI overhaul for Neovim, built on top of LazyVim.

Currently in very early stages and testing ...

Structure so far:

- colors/osrsified.lua - entry point
- lua/osrsified/colors.lua - palette
- lua/osrsified/highlights.lua - highlight groups
- lua/osrsified/init.lua - applies theme
- lua/osrsified/heirline.lua - orchestration for statusline and bufferline
- lua/osrsified/statusline.lua / bufferline.lua - actual components that get called in heirline.lua
- lua/osrsified/explorer.lua - changes the file explorer brought up with `<leader>e`

## WIP Notes

- got a somewhat working file explorer change, although still needs lots of tweaking to feel right.
  - might take adding in further components (like the world map) for it to look right
