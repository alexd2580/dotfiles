ZSH_DIR="$HOME/.config/zsh"

export EDITOR=vim
export KEYTIMEOUT=1

setopt NOMATCH  # Print error if pattern matches nothing.
setopt NOTIFY   # Report status of background jobs immediately.

source "$ZSH_DIR/liquidprompt.zsh"
source "$ZSH_DIR/aliases.zsh"
source "$ZSH_DIR/zoxide.zsh"
source "$ZSH_DIR/history.zsh"
source "$ZSH_DIR/fzf.zsh"
source "$ZSH_DIR/lazy-nvm.zsh"
source "$ZSH_DIR/segfault-hook.zsh"

# Load zgen itself and plugins.
ZGEN_DIR="$ZSH_DIR/zgen"
source "$ZGEN_DIR/zgen.zsh" > /dev/null
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load liquidprompt/liquidprompt

    zgen load chrissicool/zsh-256color
    zgen load robbyrussell/oh-my-zsh plugins/colored-man-pages # Does not work... WHY?
    # zgen load marlonrichert/zsh-autocomplete zsh-autocomplete.plugin.zsh main
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting # Must be last.

    zgen save
fi

# Make up and down search prefix through history.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey -M viins "^[[H" beginning-of-line
bindkey -M viins "^[[F" end-of-line
bindkey -M viins "^[[3~" delete-char

bindkey -M vicmd "^[[H" beginning-of-line
bindkey -M vicmd "^[[F" end-of-line
bindkey -M vicmd "^[[3~" delete-char

zstyle ':completion:*' menu select
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:tab:*' fzf-completion yes
