#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:editor' keymap 'vi'

# Auto convert .... to ../..
zstyle ':omz:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:terminal' auto-title 'yes'

# Set the plugins to load (see $OMZ/plugins/).
if [[ "$OSTYPE" == darwin* ]]
then
    source ~/.zshrc_mac
fi
if [ -e ~/.zshrc_specific ]
then
    source ~/.zshrc_specific
fi
zstyle ':omz:load' plugin 'osx' 'macports' 'archive' 'git' 'rsync' 'python' 'history-substring-search' 'zsh-syntax-highlighting'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:prompt' theme 'customprose'

# This will make you shout: OH MY ZSHELL!
source "$HOME/.oh-my-zsh/init.zsh"

# Customize to your needs...
setopt autocd

# my old key bindings
# bindkey -M viins '^?' backward-delete-char
# bindkey -M viins '^H' backward-delete-char
# bindkey -M viins '^A' beginning-of-line
# bindkey -M viins '^E' end-of-line
# bindkey -M viins '^K' kill-line
# bindkey -M viins '^D' delete-char
bindkey -M viins '^Y' yank
bindkey -M viins '' undo
# bindkey -M viins "\e[Z" reverse-menu-complete
# bindkey -M viins "^[[A" history-search-backward
# bindkey -M viins "^[[B" history-search-forward
# bindkey -M viins '[1;9A' up-line-or-history
# bindkey -M viins '[1;9B' down-line-or-history

export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
    . /opt/local/etc/profile.d/autojump.sh
fi

compdef pkill=kill
compdef pkill=killall

fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        bg
        zle redisplay
    else
        zle push-input
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

### commands to remember
## network mapping
# nmap -sP [-O] 192.168.1.0/24 , -sP is fast, -sF and -sS give increasingly more info
## ram inspection...
# sudo dd if=/dev/mem | cat | strings , or gstrings

