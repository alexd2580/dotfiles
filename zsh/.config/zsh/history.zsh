HISTFILE="$ZSH_DIR/history"
HISTSIZE=20000000
SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY         # Special history format with timestamp.
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS         # Ignore second instance of same event.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE        # Ignore entries with leading space.
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY       # Immediately write to history.
setopt SHARE_HISTORY            # Share history between session.
setopt NO_HIST_BEEP             # fucking beep
