#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias py='python3'
alias c='gcc'
alias cpp='g++'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
PS1='[\u@\h \W]\$ '

##############################################################################

# Envs
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export VISUAL=nvim
export EDITOR={$VISUAL}
export LS_COLORS=$(vivid generate rose-pine)

##############################################################################

# fetch
if { [[ "$TERM" == "xterm-256color" ]] || [[ -n "$TMUX" ]]; } \
    && [[ -z "$VSCODE_PID" ]] && [[ -z "$NVIM" ]]; then
    fastfetch
fi

# starship
eval "$(starship init bash)"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init --cmd cd bash)"
