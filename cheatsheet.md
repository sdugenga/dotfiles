## Neovim Motions Cheat Sheet

## Modes

| Key | Action |
|-----|--------|
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `I` | Insert at start of line |
| `A` | Insert at end of line |
| `o` | New line below, insert mode |
| `O` | New line above, insert mode |
| `v` | Visual mode (character) |
| `V` | Visual mode (line) |
| `Ctrl+v` | Visual block mode |
| `Esc` | Return to Normal mode |

---

## Navigation

| Key | Action |
|-----|--------|
| `h j k l` | Left, down, up, right |
| `w` | Next word (start) |
| `b` | Previous word (start) |
| `e` | Next word (end) |
| `0` | Start of line |
| `^` | First non-blank character of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `{number}G` | Go to line number |
| `Ctrl+d` | Half page down |
| `Ctrl+u` | Half page up |
| `%` | Jump to matching bracket |
| `*` | Jump to next occurrence of word under cursor |
| `#` | Jump to previous occurrence of word under cursor |

---

## Editing

| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `r` | Replace character under cursor |
| `dd` | Delete (cut) line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `>>` | Indent line |
| `<<` | De-indent line |
| `~` | Toggle case of character |
| `.` | Repeat last action |

---

## Operators + Motions

Operators combine with motions: `{operator}{motion}`

| Operator | Action |
|----------|--------|
| `d` | Delete |
| `y` | Yank (copy) |
| `c` | Change (delete + insert mode) |

**Examples:**

| Key | Action |
|-----|--------|
| `dw` | Delete to next word |
| `d$` | Delete to end of line |
| `diw` | Delete inner word |
| `ciw` | Change inner word |
| `ci"` | Change inside quotes |
| `di(` | Delete inside parentheses |
| `yy` | Yank whole line |
| `y$` | Yank to end of line |

---

## Search & Replace

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |

---

## File & Buffers

| Key | Action |
|-----|--------|
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `:e filename` | Open file |
| `:bn` | Next buffer |
| `:bp` | Previous buffer |

---

## Splits & Windows

| Key | Action |
|-----|--------|
| `:sp` | Horizontal split |
| `:vsp` | Vertical split |
| `Ctrl+w h/j/k/l` | Navigate between splits |
| `Ctrl+w q` | Close split |

---

## Numbers as Multipliers

Most motions accept a number prefix: `{number}{motion}`

| Key | Action |
|-----|--------|
| `5j` | Move down 5 lines |
| `3dd` | Delete 3 lines |
| `10w` | Jump forward 10 words |
| `2yy` | Yank 2 lines | Cheatsheet

## Tmux — prefix is Ctrl-a

| Key | Action |
|-----|--------|
| `Ctrl-a \` | vertical split |
| `Ctrl-a -` | horizontal split |
| `Ctrl-a arrow` | move between panes |
| `Ctrl-a z` | zoom pane fullscreen / back |
| `Ctrl-a x` | close pane |
| `Ctrl-a r` | reload tmux config |
| `Ctrl-a d` | detach session |
| `tmux attach` | reattach to session |

---

## Neovim — Modes

| Key | Action |
|-----|--------|
| `i` | insert mode |
| `v` | visual mode (character) |
| `V` | visual mode (line) |
| `Ctrl-v` | visual block mode |
| `Esc` | back to normal mode |
| `:` | command mode |

---

## Neovim — Navigation

| Key | Action |
|-----|--------|
| `h j k l` | left / down / up / right |
| `w` | next word |
| `b` | previous word |
| `gg` | top of file |
| `G` | bottom of file |
| `50G` | jump to line 50 |
| `Ctrl-d` | scroll down half page (centred) |
| `Ctrl-u` | scroll up half page (centred) |

---

## Neovim — Editing

| Key | Action |
|-----|--------|
| `yy` | yank (copy) line |
| `yw` | yank word |
| `p` | paste after |
| `P` | paste before |
| `dd` | delete line |
| `dw` | delete word |
| `u` | undo |
| `Ctrl-r` | redo |
| `o` | new line below, insert mode |
| `O` | new line above, insert mode |
| `J` (visual) | move selection down |
| `K` (visual) | move selection up |
| `ggVG` | select all |

---

## Neovim — Files and Buffers

| Key | Action |
|-----|--------|
| `:e filename` | open file |
| `:w` | save |
| `:q` | quit |
| `:wq` | save and quit |
| `:qa` | quit all |
| `:bnext` | next buffer |
| `:bprev` | previous buffer |
| `:vsplit` | vertical split |
| `:split` | horizontal split |
| `Ctrl-h/j/k/l` | move between splits |

---

## Neovim — Leader (Space)

| Key | Action |
|-----|--------|
| `Space ff` | telescope find files |
| `Space fg` | telescope live grep |
| `Space fb` | telescope buffers |
| `Space h` | clear search highlights |
