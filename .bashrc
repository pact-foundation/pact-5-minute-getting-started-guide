# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
clear

echo -e '
                                                                  tttt                    iiii                   
                                                               ttt:::t                   i::::i                  
                                                               t:::::t                    iiii                   
                                                               t:::::t                                           
ppppp   ppppppppp     aaaaaaaaaaaaa      ccccccccccccccccttttttt:::::ttttttt            iiiiiii    ooooooooooo   
p::::ppp:::::::::p    a::::::::::::a   cc:::::::::::::::ct:::::::::::::::::t            i:::::i  oo:::::::::::oo 
p:::::::::::::::::p   aaaaaaaaa:::::a c:::::::::::::::::ct:::::::::::::::::t             i::::i o:::::::::::::::o
pp::::::ppppp::::::p           a::::ac:::::::cccccc:::::ctttttt:::::::tttttt             i::::i o:::::ooooo:::::o
 p:::::p     p:::::p    aaaaaaa:::::ac::::::c     ccccccc      t:::::t                   i::::i o::::o     o::::o
 p:::::p     p:::::p  aa::::::::::::ac:::::c                   t:::::t                   i::::i o::::o     o::::o
 p:::::p     p:::::p a::::aaaa::::::ac:::::c                   t:::::t                   i::::i o::::o     o::::o
 p:::::p    p::::::pa::::a    a:::::ac::::::c     ccccccc      t:::::t    tttttt         i::::i o::::o     o::::o
 p:::::ppppp:::::::pa::::a    a:::::ac:::::::cccccc:::::c      t::::::tttt:::::t        i::::::io:::::ooooo:::::o
 p::::::::::::::::p a:::::aaaa::::::a c:::::::::::::::::c      tt::::::::::::::t ...... i::::::io:::::::::::::::o
 p::::::::::::::pp   a::::::::::aa:::a cc:::::::::::::::c        tt:::::::::::tt .::::. i::::::i oo:::::::::::oo 
 p::::::pppppppp      aaaaaaaaaa  aaaa   cccccccccccccccc          ttttttttttt   ...... iiiiiiii   ooooooooooo   
 p:::::p                                                                                                         
 p:::::p                                                                                                         
p:::::::p                                                                                                        
p:::::::p                                                                                                        
p:::::::p                                                                                                        
ppppppppp                                                                                                        
'

echo "Welcome to the Pact 5 minute getting starting guide"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the promptbelow)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability;turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

RED='\e[91m'
GREEN='\e[92m'
BROWN='\e[93m'
BLUE='\e[94m'
PURPLE='\e[95m'
CYAN='\e[96m'
GRAY='\e[97m'

export TERM=xterm-256color

export PATH="$PATH:$HOME"

PS1="\[${BLUE}\]welcome\[${GRAY}\]@\[${GREEN}\]pact.io\[${GRAY}\]:\[${BROWN}\]\w\[${GRAY}\]$ \[${GRAY}\]"

export GIT_COMMIT=$(git rev-parse HEAD)
export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Welcome! try and run one of the scripts below!"
npm run intro