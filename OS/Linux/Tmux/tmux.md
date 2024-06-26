Install: ``apt install tmux``

Create a new session: ``tmux new -s mysession``

Split pane vertically: ``Ctrl b`` + ``%``

Split pane horizontally: ``Ctrl b`` + ``"``

Move between panes: ``Ctrl b`` + arrows

Create new window: ``Ctrl b`` + c

Move between windows: ``Ctrl b`` + n

Resize panes:

``Ctrl b`` + ``:`` + 

```
 resize-pane -D (Resizes the current pane down)
 resize-pane -U (Resizes the current pane upward)
 resize-pane -L (Resizes the current pane left)
 resize-pane -R (Resizes the current pane right)
 resize-pane -D 20 (Resizes the current pane down by 20 cells)
 resize-pane -U 20 (Resizes the current pane upward by 20 cells)
 resize-pane -L 20 (Resizes the current pane left by 20 cells)
 resize-pane -R 20 (Resizes the current pane right by 20 cells)
 resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
 resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)

```

Detach from session: ``Ctrl b`` + d

Switch sessions: ``Ctrl b`` + s

To check session: ``tmux ls``

To attach to a session: ``tmux attach -t mysession``

To kill a session, simply use: ``exit``

Extra ones:

Big clock: ``Ctrl b`` + ``t``

Shortcuts: ``Ctrl b`` + ``?``

You can also create a `.tmux.config` file to create custom keybinds

```
set -g mouse on

new
neww
splitw -h
splitw -v

bind h split-window -v
bind v split-window -h

unbind r
bind r source-file ~/.tmux.conf 

bind i resize-pane -L 5
bind b resize-pane -D 5
bind s resize-pane -U 5
bind d resize-pane -R 5
```



