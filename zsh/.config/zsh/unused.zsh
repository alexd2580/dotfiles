# # autoload -U compinit && compinit
# autoload -U promptinit && promptinit
#
# # https://github.com/jeffreytse/zsh-vi-mode/blob/master/zsh-vi-mode.zsh#L35
# function zvm_config() {
#     ZVM_KEYTIMEOUT=0.01
#     ZVM_ESCAPE_KEYTIMEOUT=0.01
# }

# Let's try without for now


# # Not used since we directly go into completion menu.
# # zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
# # zstyle ':autocomplete:*history*:*' insert-unambiguous yes
# # zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
#
# # Open menu
# bindkey '\t' menu-select
# # bindkey "$terminfo[kcbt]" menu-select
#
# # Cycle through menu.
# bindkey -M menuselect '\t' menu-complete
# bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
#
# # To remove semicolons at the end of the history menu go to zsh-autocomplete and
# # edit `Completions/_autocomplete__history_lines`. Remove `suf`.
#

# export PATH="$PATH":"$HOME/.local/bin":"$HOME/.ghcup/bin":"$HOME/.cabal/bin"
