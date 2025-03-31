## CLI with amazing git commands

### Create a valid branch name from pasted text with line breaks, spaces and invalid characters

For example, `gitto --command create` will take any multiline text pasted in the terminal and create a valid branch name from it.

For example,

```
TICKET-9682
FRONTEND | Fix quantity change error message UI issue
```

will become `TICKET-9682-FRONTEND-Fix-quantity-change-error-message-UI-issue`

Useful when you want to copy a ticket name from the JIRA page and fastly create a branch name from it.

### Switch between latest branches

`gitto --command switch` will open a navigation panel with all branches sorted by date of use. You can use arrows to move between them and select with enter. It will checkout to that branch.

### More functionalities in the future?

Maybe, this is just my second Rust project for personal use, so let's see.
