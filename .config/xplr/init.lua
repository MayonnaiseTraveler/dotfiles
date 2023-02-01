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
