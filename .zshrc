#################
###  PROMPT   ###
#################


### CHRIS CONFIG (TESTING)

## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git 
zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

# format our main prompt for hostname current folder, and permissions.
PROMPT="%B%{$fg[red]%}[%{$fg[cyan]%}%n%{$fg[blue]%}@%{$fg[cyan]%}%m%{$fg[red]%}] %(?:%{$fg_bold[green]%}➜  :%{$fg_bold[red]%}➜  )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "


#################
### ALIASES ###
#################


alias cf='cd ~/CP/cforces/easy'
alias conf='nvim ~/.config/nvim'
alias conff='cd ~/.config/nvim'

alias i3conf='nvim ~/.config/i3/config'
alias dwmconf='cd suckless/dwm && nvim ~/suckless/dwm/config.def.h'
alias stconf='nvim ~/suckless/st/config.h'
alias dmenuconf='nvim ~/suckless/dmenu/config.h'
alias blocksconf='nvim ~/suckless/dwmblocks/config.h'

alias mitpy='nvim ~/python/6_0001'
alias dunstrc='nvim ~/.config/dunst/dunstrc'

alias courses='nvim ~/Documents/vimwiki/Courses.wiki'
alias notes='nvim ~/Documents/vimwiki/Notes.wiki'
alias vwiki='nvim ~/Documents/vimwiki/index.wiki'
alias vw='nvim ~/Documents/vimwiki/index.wiki'
alias github='nvim system/github.txt'
alias pkgs='sudo pacman -Qe > .pacman.list'
alias clock='tty-clock -t -c -C 4'

alias lg='lazygit'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gp='git pull'
alias gP='git push'
alias grv='git remote -v'

alias smi='make && sudo make clean install'
alias rsmi='rm -rf config.h && make && sudo make clean install'
alias bsmi='rm -rf blocks.h && make && sudo make clean install'
alias dwmb='dwmblocks'
alias rmo='remote add origin'
alias gpom='git pull origin master'

#alias cat=ccat


#################
### FUNCTIONS ###
#################


#mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

fzcd()
{
    cd ~
    file=$(fzf -q "$1")
    dir=$(dirname "$file")
    cd "$dir"
}

fzopen()
{
    open "$(fzf)"
}

fznv()
{
    nvim "$(fzf)"
}

fzcdnv() {
    cd ~
    file=$(fzf -q "$1")
    nvim "$file"
    dir=$(dirname "$file")
    cd "$dir"
}

current_branch() {
  git_current_branch
}

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/antz/.zshrc'

#setopt menucomplete
#setopt automenu

autoload -Uz compinit
compinit
# End of lines added by compinstall



#################
###   MISC    ###
#################


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/antz/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/antz/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/antz/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/antz/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-file ~/.rgignore'


##################
### ON STARTUP ###
##################


neofetch

source /home/antz/.config/broot/launcher/bash/br
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
