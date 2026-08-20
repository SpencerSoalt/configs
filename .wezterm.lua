local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-----------------------------------------------------------
-- WSL
-----------------------------------------------------------

-- Run `wsl -l -q` in PowerShell to see your distro name.
-- Change this if yours is different.
config.default_domain = "WSL:Ubuntu"

-----------------------------------------------------------
-- Rendering / performance
-----------------------------------------------------------

-- Try WebGPU/DX12.
-- If it performs worse on your machine, change to "OpenGL".
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- Set this to your monitor refresh rate.
config.max_fps = 144

-- Lower animation rate saves a little unnecessary rendering work.
config.animation_fps = 10

-----------------------------------------------------------
-- Font
-----------------------------------------------------------

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.5
config.line_height = 1.0

-----------------------------------------------------------
-- Cursor
-----------------------------------------------------------

config.default_cursor_style = "SteadyBar"

-----------------------------------------------------------
-- Colors
-----------------------------------------------------------

-- Excellent neutral dark theme.
-- Easy to swap later with:
-- wezterm show color-schemes
config.color_scheme = "Tokyo Night"

-----------------------------------------------------------
-- Window
-----------------------------------------------------------

-- No transparency = fastest rendering and cleanest text.
config.window_background_opacity = 1.0

-- Remove Windows title bar while retaining resize border.
config.window_decorations = "RESIZE"

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 4,
}

-- Start at a useful size.
config.initial_cols = 120
config.initial_rows = 32

-----------------------------------------------------------
-- Tabs
-----------------------------------------------------------

-- tmux owns windows/tabs.
config.enable_tab_bar = false

-----------------------------------------------------------
-- Scrollback
-----------------------------------------------------------

-- tmux has its own history, so don't go crazy here.
config.scrollback_lines = 10000

-----------------------------------------------------------
-- Mouse
-----------------------------------------------------------

-- Makes the pointer disappear while typing.
config.hide_mouse_cursor_when_typing = true

-----------------------------------------------------------
-- Hyperlinks
-----------------------------------------------------------

-- WezTerm automatically recognizes URLs.
-- Ctrl+click opens them.

-----------------------------------------------------------
-- Bell
-----------------------------------------------------------

-- No annoying system beep.
config.audible_bell = "Disabled"

-- No visual bell either. Zero-length fades mean nothing is ever
-- drawn, so BEL is silently ignored: no flash, no cursor tint.
config.visual_bell = {
  fade_in_duration_ms = 0,
  fade_out_duration_ms = 0,
}

-----------------------------------------------------------
-- Keys
-----------------------------------------------------------

config.keys = {

  ---------------------------------------------------------
  -- Command Palette
  ---------------------------------------------------------

  {
    key = "p",
    mods = "CTRL|SHIFT",
    action = act.ActivateCommandPalette,
  },

  ---------------------------------------------------------
  -- Quick Select
  --
  -- One of my favorite WezTerm features.
  -- Highlights URLs, hashes, paths, numbers, etc.
  ---------------------------------------------------------

  {
    key = "Space",
    mods = "CTRL|SHIFT",
    action = act.QuickSelect,
  },

  ---------------------------------------------------------
  -- Copy Mode
  --
  -- Vim-like keyboard navigation through terminal output.
  ---------------------------------------------------------

  {
    key = "x",
    mods = "CTRL|SHIFT",
    action = act.ActivateCopyMode,
  },

  ---------------------------------------------------------
  -- Search terminal history
  ---------------------------------------------------------

  {
    key = "f",
    mods = "CTRL|SHIFT",
    action = act.Search({
      CaseInSensitiveString = "",
    }),
  },

  ---------------------------------------------------------
  -- Paste
  ---------------------------------------------------------

  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = act.PasteFrom("Clipboard"),
  },

  ---------------------------------------------------------
  -- Copy selected text
  ---------------------------------------------------------

  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = act.CopyTo("Clipboard"),
  },

  ---------------------------------------------------------
  -- Font size
  ---------------------------------------------------------

  {
    key = "=",
    mods = "CTRL",
    action = act.IncreaseFontSize,
  },

  {
    key = "-",
    mods = "CTRL",
    action = act.DecreaseFontSize,
  },

  {
    key = "0",
    mods = "CTRL",
    action = act.ResetFontSize,
  },

  ---------------------------------------------------------
  -- Fullscreen
  ---------------------------------------------------------

  {
    key = "F11",
    action = act.ToggleFullScreen,
  },

  ---------------------------------------------------------
  -- Reload config
  ---------------------------------------------------------

  {
    key = "r",
    mods = "CTRL|SHIFT",
    action = act.ReloadConfiguration,
  },
}

-----------------------------------------------------------
-- Misc
-----------------------------------------------------------

-- WezTerm already automatically reloads this file when saved.
config.automatically_reload_config = true

return config
