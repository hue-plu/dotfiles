let options = {
  "prevent_autofocus": true,
  "config_file_directory": "~/.config/vimfx",
  "mode.normal.scroll_left": "",
  "mode.normal.scroll_right": "",
  "mode.normal.scroll_half_page_down": "<c-d>",
  "mode.normal.scroll_half_page_up": "<c-u>",
  "mode.normal.tab_select_previous": "h",
  "mode.normal.tab_select_next": "l",
  "mode.normal.tab_close": "dd",
  "mode.normal.esc": "<force><escape> <force><c-[>",
  "mode.caret.exit": "<escape> <c-[>",
  "mode.hints.exit": "<escape> <c-[>",
  "mode.find.exit": "<escape>  <c-[>  <enter>",
  "mode.marks.exit": "<escape> <c-[>"
}

Object.entries(options).forEach(([option, value]) => vimfx.set(option, value))
