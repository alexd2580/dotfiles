# NVM
lazynvm() {
  unset -f nvm node npm
  source /usr/share/nvm/init-nvm.sh
}

nvm() {
  lazynvm
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}
