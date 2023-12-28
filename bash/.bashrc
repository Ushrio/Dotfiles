# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load alias file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

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
shopt -s globstar

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

# Set vi mode as the defualt mode (Still starts in insert mode)
set -o vi
# show the current vi mode in the prompt
bind 'set show-mode-in-prompt on'
# Set the symbols and colors used by insert and command mode
bind 'set vi-cmd-mode-string "\1\e[00;31m\2 :\1\e[00m\2"'
bind 'set vi-ins-mode-string "\1\e[00;31m\2 +\1\e[00m\2"'
# Show the matching letters on [Tab][Tab] auto completion
bind 'set colored-completion-prefix on'

# Create a function that grabs the current git branch for git repos
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Don't be stopped by <C-s> and <C-q> in terminals
stty -ixon

# Set the correct shell name for window titles
# Gets rid of everything up to the last /
thisShell=$SHELL
shell="${thisShell##*/}"
# Set window title for terminals to cwd
title='\[\e]0;$shell - \w\a\]'

# Export a custom status line for bash as well as set window title for Alacritty
export PS1=" \W \[\e[00;32m\]\$(git_branch)\[\e[00m\]λ "

# set custom PATH variables
export JAVA_HOME="/usr/bin/java"
export EB_HOME="$HOME/.ebcli-virtual-env"
PATH="$JAVA_HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin:/opt/homebrew/bin:$EB_HOME/executables:$PATH"

# Set up default editors
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/greg/programs/google-cloud-sdk/path.bash.inc' ]; then . '/home/greg/programs/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/greg/Programs/google-cloud-sdk/completion.bash.inc' ]; then . '/home/greg/Programs/google-cloud-sdk/completion.bash.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
