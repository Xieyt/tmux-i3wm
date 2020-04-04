# Tmux Tilish

This is a plugin that makes `tmux` act and feel more like a tiling window
manager. Most of the keybindings are just taken [directly from `i3wm`][1].
However, I have made some adjustments to make the keybindings more similar
to `vim`: notably, using <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> 
instead of <kbd>j</kbd><kbd>k</kbd><kbd>l</kbd><kbd>;</kbd> for cardinal 
directions, and `vim`'s interpretations of what a "split" and "vsplit" is.

You can find a full list of keybindings below. I'd be happy to receive 
feedback and suggestions. For instance, if there's interest, I could add
a config option that makes the keybindings more similar to "vanilla" `i3wm`.
However, I have the impression that *most* `i3wm` users anyway remap their 
keys to be more like `vim`, so I'm not adding this unless there's interest.

[1]: https://i3wm.org/docs/refcard.html

## Why?

Okay, so who is this plugin for anyway? You may be interested in this if:

- You're using or interested in using `tmux`, but find the default keybindings
  a bit clunky. This lets you try out an alternative keybinding paradigm, 
  which uses a modifier key (<kbd>Alt</kbd>) instead of a prefix key 
  (e.g. <kbd>Ctrl</kbd> + <kbd>b</kbd>).
- You love `i3wm`, but also do a remote work over `ssh` + `tmux`. This lets 
  you use similar keybindings in both contexts.
- You also use other platforms like Gnome, Mac, or WSL. You want to take 
  your `i3wm` muscle memory with you via `tmux`.
- You're not really using `i3wm` anymore, but you did like how it handled
  terminals and workspaces. You'd like to keep working that way in terminals,
  without using `i3wm` or `sway` for your whole desktop.

Personally, I made this because I loved the `i3wm` paradigm and keybindings,
but these days I'm mostly using Gnome/Wayland at home and WSL/Windows at work.
Now, `tmux` lets me have a consistent user interface for tabs and splits across
both platforms, and this plugin lets me use the (IMHO) more efficient `i3wm` keys.

## Quickstart

The easiest way to install this plugin is via the [Tmux Plugin Manager][2].
Just add the following to `~/.tmux.conf`, then press <kbd>Ctrl</kbd> + <kbd>b</kbd>
followed by <kbd>Shift</kbd> + <kbd>i</kbd> to install it (assuming default prefix key):

	set -g @plugin 'jabirali/tmux-tilish'

It is also recommended that you add the following to the top of your `.tmux.conf`:

	set -s escape-time 0
	set -g base-index 1

This plugin should work fine without these settings. However, without the first one,
you may accidentally trigger e.g. the <kbd>Alt</kbd> + <kbd>h</kbd> binding by pressing
<kbd>Esc</kbd> + <kbd>h</kbd>, something that can happen often if you use `vim` in `tmux`. 
The second one makes the window numbers go from 1-10 instead of 0-9, which IMO
makes more sense on a keyboard where the number row starts at 1. This behavior
is also more similar to how `i3wm` numbers its workspaces. However, the plugin
will check this setting explicitly when mapping keys, and works fine without it.

[2]: https://github.com/tmux-plugins/tpm

## Keybindings

Finally, here is a list of the actual keybindings. Most are [taken from `i3wm`][1].
Below, a "workspace" is what `tmux` would call a "window" and `vim` would call a "tab",
while a "pane" is what `i3wm` would call a "window" and `vim` would call a "split".

To switch workspaces, use <kbd>Alt</kbd> + <kbd>0</kbd>-<kbd>9</kbd>. Similarly, 
the keybindings <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd>-<kbd>9</kbd> 
moves the currently selected pane between workspaces. These bindings should behave
exactly like in `i3wm`, just with a possibly different modifier key. Note that 
<kbd>Alt</kbd> + <kbd>0</kbd> and <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd>
try to be "smart": depending on your `base-index`, they will either let <kbd>0</kbd>
refer to workspace number 0 or 10.

Within a workspace, you can also move around exactly like in `i3wm`, just using 
`vim`-like <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> bindings instead of 
the default <kbd>j</kbd><kbd>k</kbd><kbd>l</kbd><kbd>;</kbd> bindings. This means
that <kbd>Alt</kbd> + <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> should move
your focus to the pane that is to the left/down/up/right of where you are now.
<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>
should instead move the current pane in the given direction; for instance, pressing
<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd> would move the current pane to the
left, by swapping it with the window to the left, and then moving the focus there.

Like in `i3wm`, pressing <kbd>Alt</kbd> + <kbd>Enter</kbd> opens a new terminal pane.
I've configured this to always open new terminals "at the end" of the current
layout, without changing the currently selected layout. After creating it, you
can move it around within a layout with the keybindings from the previous paragraph.
Switching between layouts is then done using <kbd>Alt</kbd> + either <kbd>s</kbd>
(split), <kbd>S</kbd> (only splits), <kbd>v</kbd> (vsplit), <kbd>V</kbd> (only vsplits),
<kbd>t</kbd> (tiled), and <kbd>f</kbd> (fullscreen). The "splits" and "vsplits" refer 
to the kind of layout you get using `:split` and `:vsplit` in `vim`. The "fullscreen"
has the same meaning and keybinding as in `i3wm`, and is what `tmux` calls a "zoomed pane".
Since the tiling layouts in `i3wm` are not exactly the same as in `tmux`, most keybindings
above are not exactly the same either. I've therefore just tried to make them simple and
mnemonic, and also somewhat consistent with `vim` nomenclature for people using that.

Finally, there are some convenience commands that are exactly like in `i3wm`.
Pressing <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>q</kbd> quits a pane,
<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd> exits (detaches) `tmux`,
<kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>c</kbd> reloads the config file.

The keybindings that move panes between workspaces assume a US keyboard layout.
As far as I know, `tmux` has no way of knowing what your keyboard layout is,
especially if you're working over `ssh`. However, if you know of a way to make 
this more portable without manually adding all keyboard layouts, let me know.

The keybindings for switching panes are provided as a fallback. However, if you
use Vim as your editor, I highly recommend that you use [`vim-tmux-navigator`][3].
In that case, you should override the 
<kbd>Alt</kbd> + <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> bindings at the 
bottom of your `.tmux.conf` with those recommended by `vim-tmux-navigator`.

[3]: https://github.com/christoomey/vim-tmux-navigator
