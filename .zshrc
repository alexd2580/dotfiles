autoload -U compinit && compinit
autoload -U promptinit && promptinit

# ZGEN
source "$HOME/.zgen/zgen.zsh" > /dev/null

# PLUGINS
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load robbyrussell/oh-my-zsh plugins/colored-man-pages
    zgen load robbyrussell/oh-my-zsh plugins/colorize
    zgen load robbyrussell/oh-my-zsh plugins/scd
    zgen load robbyrussell/oh-my-zsh plugins/zsh-navigation-tools
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load nojhan/liquidprompt
    zgen load chrissicool/zsh-256color
    zgen load trystan2k/zsh-tab-title

    zgen load marlonrichert/zsh-autocomplete zsh-autocomplete.plugin.zsh main

    # zgen load zsh-users/zsh-completions src
    # zgen load zsh-users/zsh-autosuggestions
    # zgen load softmoth/zsh-vim-mode


    zgen save
fi

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately
setopt nohashdirs           # disable hashing of dirs so we don't have to run
                            # rehash after installing new binaries (performance hit?)

# Key stuff
bindkey -v
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd) printf '\033[0 q'; RPS1='%{%K{#444444}%}%{%B%}[-- NORMAL --]%{%b%}%{%k%}';;
        viins|main) printf '\033[5 q'; RPS1='%{%K{#1010A0}%}%{%B%}[-- INSERT --]%{%b%}%{%k%}';;
    esac
    RPS2=$RPS1

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Compatibility with vim mode.
bindkey -v '^[[3~' delete-char
bindkey -v '^[3;5~' delete-char

bindkey -v '^?' backward-delete-char

# History
HISTFILE=~/.zsh_history
HISTSIZE=2000000
SAVEHIST=$HISTSIZE

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space

# Correction
setopt correct              # spelling correction for commands
setopt correctall           # spelling correction for arguments

# list contents of directories in a tree-like format
if [ -z "\${which tree}" ]; then
  tree () {
      find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  }
fi

# Misc aliases
alias ls=lsd
alias la='lsd -lahF'
alias grep='grep --color=auto'
alias sys='sudo systemctl'

alias spacman='sudo pacman'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# enables CTRL-T and CTRL-R fuzzy stuff
source /usr/share/fzf/key-bindings.zsh

source /usr/share/nvm/init-nvm.sh

segfault_hook () {
    if [ $? -eq 139 ]; then
        mpg123 -o pulse -q ~/.zgen/Scheisssoeee.mp3
    fi
}

if [ -z ${precmd_functions+x} ]; then
    precmd_functions=(segfault_hook title_hook);
else
    precmd_functions+=(segfault_hook title_hook);
fi

title_hook () {
    # Escape code for setting window title.
    echo -en "\033]zsh: $1\007"
}

if [ -z ${preexec_functions+x} ]; then
    preexec_functions=(title_hook);
else
    preexec_functions+=(title_hook);
fi

if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH=/usr/local/lib
else
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
fi

export PATH="$PATH":"$(yarn global bin)":"$HOME/.config/nvim/utils":"$HOME/.local/bin":"$HOME/.ghcup/bin":"$HOME/.cabal/bin"
