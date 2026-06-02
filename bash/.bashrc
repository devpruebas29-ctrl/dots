[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias ..='cd ..'
alias h='cd ~'
alias cat='bat --plain' 2>/dev/null || true
alias vim='nvim' 2>/dev/null || true
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

PS1='\[\e[38;5;117m\]\u\[\e[0m\]@\[\e[38;5;110m\]\h\[\e[0m\] \[\e[38;5;245m\]\w\[\e[0m\]\$ '

export PATH=$HOME/.opencode/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1
