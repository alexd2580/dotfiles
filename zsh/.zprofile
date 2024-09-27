export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache

# AWS
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# Azure
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# cgdb
export CGDB_DIR="$XDG_CONFIG_HOME"/cgdb

# NVidia
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# DotNet
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

# ghcup
export GHCUP_USE_XDG_DIRS=true

# GNUPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# GTK-2
# export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Cursor icons, works without it FTTB.
# export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons

# Python
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython" # Not needed since version 8.0.0
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export KERAS_HOME="${XDG_STATE_HOME}/keras"
# https://github.com/b3nj5m1n/xdg-ninja/issues/289#issuecomment-1666024202
# export PYTHONSTARTUP="$HOME"/python/pythonrc

# less
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# minikube
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube

# SQL
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export PSQL_HISTORY="$XDG_DATA_HOME"/psql_history
export SQLITE_HISTORY="$XDG_DATA"/sqlite_history

# Terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

# Node
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NVM_DIR="$XDG_DATA_HOME"/nvm
export TS_NODE_HISTORY="$XDG_STATE_HOME"/ts_node_repl_history

# RenPy
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME"

# Ruby
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# wine
export WINEPREFIX="$XDG_DATA_HOME"/wine
