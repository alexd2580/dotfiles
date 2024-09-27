LP_ENABLE_ERROR_MEANING=1
LP_ENABLE_ERROR_MEANING_EXTENDED=1
# Always on. Annoying. Therefore off.
# LP_ENABLE_KUBECONTEXT=1
# LP_ENABLE_KUBE_NAMESPACE=1
LP_ENABLE_TERRAFORM=1
LP_ENABLE_TIME=1

LP_USER_ALWAYS=0
LP_USER_ALWAYS=-1

# The following doesn't seem needed anymore...
# https://liquidprompt.readthedocs.io/en/stable/config.html#LP_ENABLE_TITLE
# if [ -z ${precmd_functions+x} ]; then
#     precmd_functions=(segfault_hook title_hook);
# else
#     precmd_functions+=(segfault_hook title_hook);
# fi
#
# if [ -z ${preexec_functions+x} ]; then
#     preexec_functions=(title_hook);
# else
#     preexec_functions+=(title_hook);
# fi
# title_hook () {
#     echo -en "\033]zsh: $1\007"
# }
