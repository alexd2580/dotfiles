alias ls=lsd
alias la='lsd -lahF'
alias grep='grep --color=auto'
alias sys='sudo systemctl'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# irssi
alias irssi="irssi --config=\"$XDG_CONFIG_HOME\"/irssi/config --home=\"$XDG_DATA_HOME\"/irssi"

# mitmproxy
alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias mitmweb="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"

# wget
alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
