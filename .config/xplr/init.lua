version = '0.21.1'
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
	.. ";"
	.. xpm_path
	.. "/?.lua;"
	.. xpm_path
	.. "/?/init.lua"

os.execute(
	string.format(
		"[ -e '%s' ] || git clone '%s' '%s'",
		xpm_path,
		xpm_url,
		xpm_path
	)
)

require("xpm").setup({

	-- package manager
	'dtomvan/xpm.xplr',
	{
		'sayanarijit/dual-pane.xplr',
		setup = function()
			require("dual-pane").setup({
				active_pane_width = { Percentage = 70 },
				inactive_pane_width = { Percentage = 30 },
			})
		end
	},
	'igorepst/context-switch.xplr',
	-- 'sayanarijit/command-mode.xplr',
	{
		'sayanarijit/wl-clipboard.xplr',
		setup = function()
			require("wl-clipboard").setup({
				copy_command = "wl-copy -t text/uri-list",
				paste_command = "wl-paste",
				keep_selection = false,
			})
		end
	},
	{
		'sayanarijit/tri-pane.xplr',
		setup = function()
			require('tri-pane').setup({
				layout_key = "T", -- In switch_layout mode
				as_default_layout = false,
				left_pane_width = { Percentage = 20 },
				middle_pane_width = { Percentage = 40 },
				right_pane_width = { Percentage = 40 },
			})
		end
	},
	{
		'sayanarijit/dragon.xplr',
		setup = function()
			require("dragon").setup({
				mode = "selection_ops",
				key = "D",
				drag_args = "",
				drop_args = "",
				keep_selection = false,
				bin = "dragon",
			})
		end
		-- Select files and type `:sD` to drag
		-- Type `:sD` without selecting anything to drop
	},
	'Junker/nuke.xplr',

	-- tool to decompress / compress stuffs
	{
		'dtomvan/ouch.xplr',
		setup = function()
			require("ouch").setup({
				mode = "action",
				key = "o",
			})
		end
	},
	'prncss-xyz/icons.xplr',




})



xplr.config.general.panel_ui.default.border_style.fg = "Red"

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
          "$HOME/.config/xplr/imv-open.sh" "$FIFO_PATH" "$XPLR_FOCUS_PATH" &
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
         echo -e "$NODES" | lvim
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


-- Type `yy` to copy and `p` to paste files.

local key = xplr.config.modes.builtin.default.key_bindings.on_key

key.v = {
	help = "nuke",
	messages = { "PopMode", { SwitchModeCustom = "nuke" } }
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o
