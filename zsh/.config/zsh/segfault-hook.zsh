# Play audio on segfault.
segfault_hook () {
    if [ $? -eq 139 ]; then
        mpg123 -o pulse -q "$ZSH_DIR/Scheisssoeee.mp3"
    fi
}

if [ -z ${precmd_functions+x} ]; then
    precmd_functions=()
fi
precmd_functions+=(segfault_hook)
