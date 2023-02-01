version = '0.20.2'
-- switch to plugin manager later
-- local home = os.getenv("HOME")
-- local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
-- local xpm_url = "https://github.com/dtomvan/xpm.xplr"

-- package.path = package.path
--   .. ";"
--   .. xpm_path
--   .. "/?.lua;"
--   .. xpm_path
--   .. "/?/init.lua"

-- os.execute(
--   string.format(
--     "[ -e '%s' ] || git clone '%s' '%s'",
--     xpm_path,
--     xpm_url,
--     xpm_path
--   )
-- )




xplr.config.modes.builtin.default.key_bindings.on_key.P = {
  help = "preview",
  messages = {
    {
      BashExecSilently0 = [===[
        FIFO_PATH="/tmp/xplr.fifo"

        if [ -e "$FIFO_PATH" ]; then
          "$XPLR" -m StopFifo
          rm -f -- "$FIFO_PATH"
        else
          mkfifo "$FIFO_PATH"
          "$HOME/.local/bin/imv-open.sh" "$FIFO_PATH" "$XPLR_FOCUS_PATH" &
          "$XPLR" -m 'StartFifo: %q' "$FIFO_PATH"
        fi
      ]===],
    },
  },
}
-- batch rename
xplr.config.modes.builtin.default.key_bindings.on_key.R = {
  help = "batch rename",
  messages = {
    {
      BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | renamer
         "$XPLR" -m ExplorePwdAsync
       fi
     ]===],
    },
  },
}



-- With `export XPLR_BOOKMARK_FILE="$HOME/bookmarks"`
-- Bookmark: mode binding
xplr.config.modes.builtin.default.key_bindings.on_key["b"] = {
  help = "bookmark mode",
  messages = {
    { SwitchModeCustom = "bookmark" },
  },
}
-- bookmarks
xplr.config.modes.custom.bookmark = {
  name = "bookmark",
  key_bindings = {
    on_key = {
      m = {
        help = "bookmark dir",
        messages = {
          {
            BashExecSilently0 = [[
              PTH="${XPLR_FOCUS_PATH:?}"
              if [ -d "${PTH}" ]; then
                PTH="${PTH}"
              elif [ -f "${PTH}" ]; then
                PTH=$(dirname "${PTH}")
              fi
              PTH_ESC=$(printf %q "$PTH")
              if echo "${PTH:?}" >> "${XPLR_BOOKMARK_FILE:?}"; then
                "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
              else
                "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
              fi
            ]],
          },
          "PopMode",
        },
      },
      g = {
        help = "go to bookmark",
        messages = {
          {
            BashExec0 = [===[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              if [ "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===],
          },
          "PopMode",
        },
      },
      d = {
        help = "delete bookmark",
        messages = {
          {
            BashExec0 = [[
              PTH=$(cat "${XPLR_BOOKMARK_FILE:?}" | fzf --no-sort)
              sd "$PTH\n" "" "${XPLR_BOOKMARK_FILE:?}"
            ]],
          },
          "PopMode",
        },
      },
      esc = {
        help = "cancel",
        messages = {
          "PopMode",
        },
      },
    },
  },
}



local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

require"icons".setup()

require("tri-pane").setup({
  layout_key = "T", -- In switch_layout mode
  as_default_layout = false,
  left_pane_width = { Percentage = 20 },
  middle_pane_width = { Percentage = 40 },
  right_pane_width = { Percentage = 40 },
  -- left_pane_renderer = custom_function_to_render_left_pane,
  -- right_pane_renderer = custom_function_to_render_right_pane
})


require("dragon").setup{
  mode = "selection_ops",
  key = "D",
  drag_args = "",
  drop_args = "",
  keep_selection = false,
  bin = "dragon",
}
-- Select files and type `:sD` to drag
-- Type `:sD` without selecting anything to drop

require("ouch").setup{
  mode = "action",
  key = "o",
}
-- tool to decompress / compress stuffs

require("wl-clipboard").setup{
  copy_command = "wl-copy -t text/uri-list",
  paste_command = "wl-paste",
  keep_selection = false,
}

-- Type `yy` to copy and `p` to paste files.


require("dual-pane").setup{
  active_pane_width = { Percentage = 70 },
  inactive_pane_width = { Percentage = 30 },
}

require("zentable").setup()
require("context-switch").setup()
require("nuke").setup()

local key = xplr.config.modes.builtin.default.key_bindings.on_key

key.v = {
	help = "nuke",
	messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o


