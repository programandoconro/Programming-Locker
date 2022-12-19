Obtained from https://gist.github.com/squarism/ae3613daf5c01a98ba3a. Credits to https://gist.github.com/squarism. 

## Tabs and Windows


**Function** | **Shortcut**
-------- | --------
New Tab | `⌘` + `T`
Close Tab or Window | `⌘` + `W`  (same as many mac apps)
Go to Tab | `⌘` + `Number Key`  (ie: `⌘2` is 2nd tab)
Go to Split Pane by Direction | `⌘` + `Option` + `Arrow Key`
Cycle iTerm Windows | `⌘` + `backtick`  (true of all mac apps and works with desktops/mission control)
**Splitting** | 
Split Window Vertically (same profile) | `⌘` + `D`
Split Window Horizontally (same profile) | `⌘` + `Shift` + `D`  (mnemonic: shift is a wide horizontal key)
**Moving** |
Move a pane with the mouse | `⌘` + `Alt` + `Shift` and then drag the pane from anywhere
**Fullscreen** |
Fullscreen | `⌘`+ `Enter`
Maximize a pane | `⌘` + `Shift` + `Enter`  (use with fullscreen to temp fullscreen a pane!)
Resize Pane | `Ctrl` + `⌘` + `Arrow` (given you haven't mapped this to something else)
**Less Often Used By Me** |
Go to Split Pane by Order of Use | `⌘` + `]` , `⌘` + `[`
Split Window Horizontally (new profile) | `Option` + `⌘` + `H`
Split Window Vertically (new profile) | `Option` + `⌘` + `V`
Previous Tab | `⌘`+ `Left Arrow`  (I usually move by tab number)
Next Tab | `⌘`+ `Right Arrow`
Go to Window | `⌘` + `Option` + `Number`


## My Favorite Shell Key Combos

These might be helpful to getting you faster with the shell.
These are just common shell shortcuts unrelated to iTerm itelf.
These will usually work in Bash/Zsh/Fish on Mac and on Linux.
There are many shortcuts out there but I use these quite a bit.
There is also more than one way to do a thing so adopt what you like best.

Hopefully some of these improve your work life.  :)

**Function** | **Key Combination** | **Use**
-------- | -------- | --------
Delete to start of line | `Ctrl` + `U` | Use this to start over typing without hitting Ctrl-C
Delete to end of line | `Ctrl` + `K` | Use this with command history to repeat commands and changing one thing at the end!
Repeat last command | `Up Arrow` | Cycle and browse your history with up and down.  `Ctrl-R` is faster if you know the string you are looking for.
Move back and forth on a line | `Arrow Keys` | This takes you off the home row but it's easy to remember
Move back and forth on a line by words | `⌥` + `Arrow Keys` | Fast way to jump by words to correct a typo or "run again" with minor changes to last command.  Ctrl as modifier might also work on mac and non-mac keyboards/shells/apps.
Delete previous word (in shell) | `Ctrl` + `W` | It's faster to delete by words.  Especially when your last command was wrong by a single typo or something.
Clear screen | `Ctrl` + `L` | This is telling the shell to do it instead of an explicit command like `clear` or `cls` in DOS.  If you use `⌘` + `K`, this is telling iTerm to clear the screen which might have the same result or do something terrible (like when using a TUI like `top` or `htop`.  In general, use this instead of typing `clear` over and over.
Exit Shell | `Ctrl` + `D` | Instead of typing exit, just get this in muscle memory.  It works in many contexts.



## Moving Faster

A lot of shell shortcuts work in iterm and it's good to learn these because arrow keys, home/end
keys and Mac equivalents don't always work.  For example `⌘` + `Left Arrow` is usually the same as `Home`
(go to beginning of current line) but that doesn't work in the shell.  Home works in many apps but it
takes you away from the home row.

**Function** | **Shortcut**
-------- | --------
Move to the start of line | `Ctrl` + `A` or `Home`
Move to the end of line | `Ctrl` + `E` or `End`
Move forward a word | `Option` + `F`
Move backward a word | `Option` + `B`
Set Mark | `⌘` + `M`
Jump to Mark | `⌘` + `J`
Moving by word on a line (this is a shell thing but passes through fine)| `Ctrl` + `Left/Right Arrow`
Cursor Jump with Mouse (shell and vim - might depend on config) | `Option` + `Left Click`


## Copy and Paste with iTerm without using the mouse

I don't use this feature too much.  I instead just mouse select (which copies to the clipboard) and paste.  There's no need to Copy to the clipboard if you have `General > Selection > Copy to pasteboard on selection` enabled.

**Function** | **Shortcut**
-------- | --------
Enter Copy Mode | `Shift` + `⌘` + `C`
Enter Character Selection Mode in Copy Mode | `Ctrl` + `V`
Move cursor in Copy Mode | `HJKL` vim motions or arrow keys
Copy text in Copy Mode | `Ctrl` + `K`

Copy actions goes into the normal system clipboard which you can paste like normal.


## Search the Command History

Some of these are not directly related to iTerm and are just "shell features".  Like, if you open Terminal.app on Mac some of these still work because it's the shell and not iTerm.  I'm including them anyway.

**Function** | **Shortcut**
-------- | --------
Search as you type | `Ctrl` + `R` and type the search term; Repeat `Ctrl` + `R` to loop through result
Search the last remembered search term | `Ctrl` + `R` twice
End the search at current history entry  | `Ctrl` + `Y`
Cancel the search and restore original line | `Ctrl` + `G`

## Misc

**Function** | **Shortcut**
-------- | --------
Clear the screen/pane (when `Ctrl + L` won't work) | `⌘` + `K`  (I use this all the time)
Broadcast command to all panes in window (nice when needed!) | `⌘` + `Alt` +  `I` (again to toggle)
Find Cursor | `⌘` + `/`  _or use a theme or cursor shape that is easy to see_
