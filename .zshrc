autoload -U compinit && compinit
autoload -U promptinit && promptinit

# ZGEN
source "$HOME/.zgen/zgen.zsh" > /dev/null

# PLUGINS
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load robbyrussell/oh-my-zsh plugins/colored-man
    zgen load robbyrussell/oh-my-zsh plugins/cabal
    zgen load robbyrussell/oh-my-zsh plugins/catimg
    zgen load robbyrussell/oh-my-zsh plugins/colorize
    zgen load robbyrussell/oh-my-zsh plugins/command-not-found
    zgen load robbyrussell/oh-my-zsh plugins/dircycle # doesn't work =(
    zgen load robbyrussell/oh-my-zsh plugins/grunt
    zgen load robbyrussell/oh-my-zsh plugins/scd
    zgen load robbyrussell/oh-my-zsh plugins/sudo
    #zgen load robbyrussell/oh-my-zsh plugins/thefuck
    zgen load robbyrussell/oh-my-zsh plugins/zsh-navigation-tools
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load nojhan/liquidprompt
    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-completions src

    zgen save
fi

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately
setopt nohashdirs           # disable hashing of dirs so we don't have to run
                            # rehash after installing new binaries (performance hit?)

# Key stuff
bindkey -e

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

bindkey '^[OC' emacs-forward-word
#bindkey '^[[C' emacs-forward-word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;3C' emacs-forward-word

bindkey '^[OD' emacs-backward-word
#bindkey '^[[D' emacs-backward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;3D' emacs-backward-word

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

bindkey '\e[1~' beginning-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[[H' beginning-of-line

bindkey '\e[4~' end-of-line
bindkey '^[OF' end-of-line
bindkey '^[[F' end-of-line

# History
HISTFILE=~/.zsh_history
HISTSIZE=2000000
SAVEHIST=$HISTSIZE
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space


# Completion
setopt complete_in_word     # complete from both ends of a word
setopt always_to_end        # move cursor to the end of a completed word
setopt path_dirs            # perform path search even on command names with slashes
setopt auto_menu            # show completion menu on a succesive tab press
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_param_slash     # if completed parameter is a directory, add a trailing slash
unsetopt menu_complete      # do not autoselect the first completion entry
unsetopt flow_control       # disable start/stop characters in shell editor

## Group matches and describe.
# zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select

## Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

## Directories
eval $(dircolors <(awk '/^TERM/ && !x {print "TERM xterm-termite"; x=1} 1' <(dircolors -p)))
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

## History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Correction
setopt correct              # spelling correction for commands
#setopt correctall           # spelling correction for arguments

# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1,1n'
alias psmem10='ps -e -orss=,args= | sort -b -k1,1n| head -10'
# get top process eating cpu if not work try excute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1 -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1 -nr | head -10'

# list contents of directories in a tree-like format
if [ -z "\${which tree}" ]; then
  tree () {
      find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  }
fi

alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress -r --"

# Misc aliases
alias ls='ls -lahF --color=auto'
alias ll='ls -lahF --color=auto'
alias la='ls -lahF --color=auto'
alias l='ls -lahF --color=auto'
alias grep='grep --color=auto'
alias sys='sudo systemctl'
alias :q='exit'

alias svim='sudo vim'
alias spacman='sudo pacman'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

segfault_hook () {
    if [ $? -eq 139 ]; then
        mpg123 -q ~/.zgen/Scheisssoeee.mp3
    fi
}

if [ -z ${precmd_functions+x} ]; then
    precmd_functions=(segfault_hook);
else
    precmd_functions+=(segfault_hook);
fi

# ssh keys
eval $(keychain --eval --agents ssh -Q --quiet)
