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
zstyle ':omz:load' plugin 'osx' 'macports' 'archive' 'git' 'rsync' 'python' 'history-substring-search' 'zsh-syntax-highlighting'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:prompt' theme 'customprose'

# This will make you shout: OH MY ZSHELL!
source "$HOME/.oh-my-zsh/init.zsh"

# Customize to your needs...
setopt autocd

if [[ "$OSTYPE" == darwin* && -e ~/.zshrc_mac ]]
then
    source ~/.zshrc_mac
fi
if [ -e ~/.zshrc_specific ]
then
    source ~/.zshrc_specific
fi

# my key bindings
bindkey -M viins "$keyinfo[Control]A" beginning-of-line
bindkey -M viins "$keyinfo[Control]E" end-of-line
bindkey -M viins "$keyinfo[Control]K" kill-line
bindkey -M viins "$keyinfo[Control]Y" yank
bindkey -M viins "$keyinfo[Control]D" delete-char
# this undo is nice for undoing tab completions
bindkey -M viins "$keyinfo[Control]T" undo

export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
    . /opt/local/etc/profile.d/autojump.sh
fi

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

# Aliases
alias pl='ipython --pylab'
alias plg='ipython qtconsole --pylab=qt'
alias pli='ipython qtconsole --pylab=inline'
alias pln='ipython notebook --pylab inline'
alias plk='ipython kernel'
alias plc='ipython console --existing'
alias gv='gvim'
alias v='vim'
alias vv='vim -u NONE'

alias top='htop'

alias cloc='cloc --exclude-dir=.git'

function mdown()
{
    (echo '
        <head>
            <style>
                body {
                    font-family: Georgia;
                    font-size: 17px;
                    line-height: 24px;
                    color: #222;
                    text-rendering: optimizeLegibility;
                    width: 670px;
                    margin: 20px auto;
                    padding-bottom: 80px;
                }
                h1, h2, h3, h4, h5, h6 {
                    font-weight: normal;
                    margin-top: 48px;
                }
                h1 { font-size: 48px; }
                h2 {
                    font-size: 36px;
                    border-bottom: 6px solid #ddd;
                    padding: 0 0 6px 0;
                }
                h3 {
                    font-size: 24px;
                    border-bottom: 6px solid #eee;
                    padding: 0 0 2px 0;
                }
                h4 { font-size: 20px; }
                pre {
                    background-color: #f5f5f5;
                    font: normal 15px Menlo;
                    line-height: 24px;
                    padding: 8px 10px;
                    overflow-x: scroll;
                }
            </style>
        </head>
    '; markdown $@)
}

function findgrep() # {{{
{
    find . -iname "$1" -exec grep -Hn "$2" {} \;
} # }}}

function redecho # {{{
{
    echo -n "\033[1;31m"
    echo "$@"
    echo -n "\033[m"
} # }}}

export LD_LIBRARY_PATH=/opt/intel/composer_xe_2011_sp1.10.319/mkl/lib/intel64/

export JULIA_EDITOR="vim"

