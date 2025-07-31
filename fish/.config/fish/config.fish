# Fish Shell Configuration
# Author: CG (@cyber-green)
# Description: Custom fish shell configuration with aliases, functions, and prompt

# Remove greeting
set fish_greeting

# Set editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Set PATH
set -gx PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $PATH

# Colors
set -g fish_color_normal normal
set -g fish_color_command cyan
set -g fish_color_keyword magenta
set -g fish_color_quote yellow
set -g fish_color_redirection normal
set -g fish_color_end green
set -g fish_color_error red
set -g fish_color_param normal
set -g fish_color_comment brblack
set -g fish_color_selection --background=brblack
set -g fish_color_search_match --background=brblack
set -g fish_color_operator green
set -g fish_color_escape cyan
set -g fish_color_autosuggestion brblack

# Directory colors
set -g fish_color_cwd cyan
set -g fish_color_cwd_root red

# Git prompt colors
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_color_upstream_ahead green
set -g __fish_git_prompt_color_upstream_behind red

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash pop'

# System aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias md='mkdir -p'
alias rd='rmdir'

# Package manager aliases (Arch Linux)
alias pac='sudo pacman'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -R'
alias pacu='sudo pacman -Syu'
alias pacss='pacman -Ss'
alias yay='yay'
alias yays='yay -S'
alias yayu='yay -Syu'

# Text editor aliases
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias nano='nvim'

# System monitoring
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ps='ps aux'
alias top='htop'

# Network
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# Misc
alias path='echo -e (string replace -a " " "\n" $PATH)'
alias reload='source ~/.config/fish/config.fish'
alias tree='tree -C'
alias weather='curl wttr.in'

# Functions
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via extract()"
        end
    else
        echo "'$argv[1]' is not a valid file!"
    end
end

function backup
    cp $argv[1] $argv[1].backup
end

function gitignore
    curl -sL https://www.gitignore.io/api/$argv
end

function copy
    cat $argv[1] | xclip -selection clipboard
end

function paste
    xclip -selection clipboard -o
end

# Development aliases
alias python='python3'
alias py='python3'
alias pip='pip3'
alias serve='python3 -m http.server'
alias json='python3 -m json.tool'

# Docker aliases (if installed)
alias dk='docker'
alias dkc='docker-compose'
alias dki='docker images'
alias dkps='docker ps'
alias dkpsa='docker ps -a'

# Custom prompt function
function fish_prompt
    set -l last_status $status
    set -l cwd (basename (prompt_pwd))
    
    # Colors
    set -l normal (set_color normal)
    set -l white (set_color white)
    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l magenta (set_color magenta)
    
    # Start with username@hostname
    echo -n (set_color --bold cyan)(whoami)$normal
    echo -n '@'
    echo -n (set_color --bold magenta)(hostname)$normal
    echo -n ' '
    
    # Current directory
    echo -n (set_color --bold yellow)$cwd$normal
    
    # Git branch if in git repo
    if git rev-parse --git-dir >/dev/null 2>&1
        set -l branch (git branch 2>/dev/null | grep '^\*' | sed 's/^\* //')
        if test -n "$branch"
            echo -n ' '
            echo -n (set_color --bold green)($branch)$normal
            
            # Git status indicators
            set -l git_status (git status --porcelain 2>/dev/null)
            if test -n "$git_status"
                echo -n (set_color red)'*'$normal
            end
        end
    end
    
    # Status indicator
    if test $last_status -ne 0
        echo -n ' '(set_color red)'✗'$normal
    else
        echo -n ' '(set_color green)'✓'$normal
    end
    
    echo -n ' '(set_color --bold white)'❯'$normal' '
end

# Right prompt with current time
function fish_right_prompt
    set -l cyan (set_color cyan)
    set -l normal (set_color normal)
    echo -n $cyan(date '+%H:%M:%S')$normal
end

# Startup message
if status is-interactive
    echo (set_color --bold cyan)"Welcome to Fish Shell!"(set_color normal)
    echo (set_color yellow)"Use 'help' for documentation or 'reload' to refresh config."(set_color normal)
end
