# ls aliases
alias ll='ls -alF'
alias lh='ls -lh'
alias la='ls -A'
alias l='ls -CF'

# navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Other aliases
alias gdb='gdb -q'
alias aslroff='sudo echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias aslron='sudo echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'
alias aslr='cat /proc/sys/kernel/randomize_va_space'
alias vi='vim'
alias vim='$(command -v nvim || echo vim)'
alias getpass='openssl rand -base64 20'

# directory aliases
alias dot='cd $HOME/.dotfiles'
