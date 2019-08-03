# If you come from bash you might have to change your $PATH. 
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH"
export PATH="/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:$PATH"
export PATH="/mnt/c/Program Files/Microsoft VS Code/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export CHEAT_USER_DIR="$HOME/dotfiles/cheat"

export EDITOR=micro

ZSH_THEME="af-magic"

export UPDATE_ZSH_DAYS=13

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_DISABLE_COMPFIX=true

plugins=(
  zsh-proxy
  zsh-autosuggestions
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ------------------------------ NVM

nvm-update() {
    (
        cd "$NVM_DIR"
        git fetch --tags origin
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# User configuration
setopt no_nomatch

ip_() {
    http --follow -b https://api.ip.sb/geoip/$1
}

git-config() {
    echo -n "Please input Git Username: "      
    read username      
    echo -n "Please input Git Email: "
    read email      
    echo -n "Done!"
    git config --global user.name "${username}"
    git config --global user.email "${email}"  
}

mc-update() {
	echo -n "Please input download url!"
	read _url
	curl -L "${_url}" > micro.tar.gz
	mkdir microd
	tar -xvzf micro.tar.gz -C microd --strip-components 1
	mv microd/micro /usr/local/bin/micro  
	rm micro.tar.gz 
	rm -rf microd
}

cdlast() {
  cd -
  ls -lrth --color=auto | tail
  zle reset-prompt
}
zle -N cdlast
bindkey '^Q' cdlast

transfer() {
	curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    echo
}

alias ohmyzsh="micro ~/.oh-my-zsh"
alias vizsh="micro ~/.zshrc"
alias rezsh="source ~/.zshrc"
alias bkzsh="cp ~/.zshrc ~/dotfiles/debian_wsl/debianwsl2.zshrc"

alias c.="code ."
alias e.="explorer.exe ."
alias cdtmp='cd `mktemp -d /tmp/artin-XXXXXX`'
alias ws="cd ~/0Workspace"
alias cls=clear

alias rmrf="rm -rf"

alias gitcm="git commit -m"
alias gitp="git push"
alias gita="git add -a"
alias gitall="git add ."

alias ping="nali-ping"
alias dig="nali-dig"
alias traceroute="nali-traceroute"
alias tracepath="nali-tracepath"
alias dig="nali-dig"
alias nslookup="nali-nslookup"
alias nali-update="sudo nali-update"

alias ct=cheat
alias mc=micro
alias vi=vim
alias lg=lazygit
alias pc4=proxychains4

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias -s php=mc
alias -s py=mc
alias -s rb=mc
alias -s html=mc
alias gcid="git log | head -1 | awk '{print substr(\$2,1,7)}' | clip.exe"



eval $(thefuck --alias)

# Created by mirror-config-china
export IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NODIST_IOJS_MIRROR=https://npm.taobao.org/mirrors/iojs
export NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NVMW_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NODIST_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVMW_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVMW_NPM_MIRROR=https://npm.taobao.org/mirrors/npm
# End of mirror-config-china